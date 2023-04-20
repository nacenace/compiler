#include <llvm/IR/Constants.h>
#include <llvm/IR/DerivedTypes.h>
#include <llvm/IR/Type.h>
// used by routine nodes
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Verifier.h>

#include <llvm/Support/Casting.h>
// used by decl nodes
#include <fmt/core.h>

#include "context.hpp"
#include "symbol.hpp"
#include "ast.hpp"

namespace spc {
/* -------- syscall nodes -------- */
llvm::Value *SysCallNode::codegen(CodegenContext &context) {
  switch (routine->routine) {
    case SysRoutine::WRITELN:
    case SysRoutine::WRITE: {
      auto char_ptr = context.builder.getInt8Ty()->getPointerTo();
      auto printf_type = llvm::FunctionType::get(context.builder.getInt32Ty(), char_ptr, true);
      auto printf_func = context.module->getOrInsertFunction("printf", printf_type);
      for (auto &arg : args->children()) {
        auto value = arg->codegen(context);
        std::vector<llvm::Value *> args;
        auto type = value->getType();
        if (type->isArrayTy())
          type = cast_node<ArrayRefNode>(arg)->get_element_type(context);
        if (type->isIntegerTy(8)) {
          args.push_back(context.builder.CreateGlobalStringPtr("%c"));
          args.push_back(value);
        } else if (type->isIntegerTy()) {
          args.push_back(context.builder.CreateGlobalStringPtr("%d"));
          args.push_back(value);
        } else if (type->isDoubleTy()) {
          args.push_back(context.builder.CreateGlobalStringPtr("%lf"));
          args.push_back(value);
        }
        // Pascal pointers are not supported, so this is an LLVM global string pointer.
        else if (type->isPointerTy()) {
          args.push_back(value);
        } else {
          if (routine->routine == SysRoutine::WRITE)
            throw CodegenException("incompatible type in write(): expected char, integer, real");
          else
            throw CodegenException("incompatible type in writeln(): expected char, integer, real");
        }
        context.builder.CreateCall(printf_func, args);
      }
      if (routine->routine == SysRoutine::WRITELN) {
        context.builder.CreateCall(printf_func, context.builder.CreateGlobalStringPtr("\n"));
      }
      return nullptr;
    }

    case SysRoutine::READ:
    case SysRoutine::READLN: {
      auto char_ptr = context.builder.getInt8Ty()->getPointerTo();
      auto scanf_type = llvm::FunctionType::get(context.builder.getInt32Ty(), char_ptr, true);
      auto scanf_func = context.module->getOrInsertFunction("scanf", scanf_type);
      for (auto &arg : args->children()) {
        std::vector<llvm::Value *> args;
        /*添加空指针判断*/
        auto ptr = cast_node<IdentifierNode>(arg)->get_ptr(context);
        if (ptr == nullptr) throw CodegenException("identifier not found: " + cast_node<IdentifierNode>(arg)->name);
        auto type = cast_node<IdentifierNode>(arg)->get_llvmtype(context);
        if (type->isArrayTy()) {
          ptr = context.builder.CreateGEP(ptr, context.builder.getInt32(cast_node<ArrayRefNode>(arg)->index));
          type = cast_node<ArrayRefNode>(arg)->get_element_type(context);
        }
        if (type->isIntegerTy(8)) {
          args.push_back(context.builder.CreateGlobalStringPtr("%c"));
          args.push_back(ptr);
        } else if (type->isIntegerTy()) {
          args.push_back(context.builder.CreateGlobalStringPtr("%d"));
          args.push_back(ptr);
        } else if (type->isDoubleTy()) {
          args.push_back(context.builder.CreateGlobalStringPtr("%lf"));
          args.push_back(ptr);
        } else {
          if (routine->routine == SysRoutine::READ)
            throw CodegenException("incompatible type in read(): expected char, integer, real");
          else
            throw CodegenException("incompatible type in readln(): expected char, integer, real");
        }
        context.builder.CreateCall(scanf_func, args);
      }
      if (routine->routine == SysRoutine::READLN) {
        context.builder.CreateCall(scanf_func, context.builder.CreateGlobalStringPtr("%*[^\n]"));
        auto getchar_type = llvm::FunctionType::get(context.builder.getInt32Ty(), false);
        auto getchar_func = context.module->getOrInsertFunction("getchar", getchar_type);
        context.builder.CreateCall(getchar_func);
      }
      return nullptr;
    }

    case SysRoutine::SQRT: {
      if (args->children().size() != 1) throw CodegenException("no matching function for call to 'sqrt'");
      auto sqrt_type = llvm::FunctionType::get(context.builder.getDoubleTy(), context.builder.getDoubleTy(), false);
      auto sqrt_func = context.module->getOrInsertFunction("sqrt", sqrt_type);
      auto arg = *args->children().begin();
      auto value = arg->codegen(context);
      if (!(value->getType()->isIntegerTy(32) || value->getType()->isDoubleTy())) {
        throw CodegenException("incompatible type in sqrt(): expected integer, real");
      }
      std::vector<llvm::Value *> args;
      if (value->getType()->isIntegerTy(32)) value = context.builder.CreateUIToFP(value, context.builder.getDoubleTy());
      args.push_back(value);
      return context.builder.CreateCall(sqrt_func, args);
    }
    case SysRoutine::ABS: {
      if (args->children().size() != 1) throw CodegenException("no matching function for call to 'abs'");
      auto fabs_type = llvm::FunctionType::get(context.builder.getDoubleTy(), context.builder.getDoubleTy(), false);
      auto fabs_func = context.module->getOrInsertFunction("fabs", fabs_type);
      auto arg = *args->children().begin();
      auto value = arg->codegen(context);
      if (!(value->getType()->isIntegerTy(32) || value->getType()->isDoubleTy()))
        throw CodegenException("incompatible type in abs(): expected integer, real");
      std::vector<llvm::Value *> args;
      if (value->getType()->isIntegerTy(32)) value = context.builder.CreateUIToFP(value, context.builder.getDoubleTy());
      args.push_back(value);
      return context.builder.CreateCall(fabs_func, args);
    }
    case SysRoutine::ORD: {
      if (args->children().size() != 1) throw CodegenException("no matching function for call to 'ord'");
      auto arg = *args->children().begin();
      auto value = arg->codegen(context);
      if (!value->getType()->isIntegerTy(8)) throw CodegenException("incompatible type in ord(): expected char");
      return context.builder.CreateZExt(value, context.builder.getInt32Ty());
    }
    case SysRoutine::PRED: {
      //只支持字符和整数
      if (args->children().size() != 1) throw CodegenException("no matching function for call to 'pred'");
      auto arg = *args->children().begin();
      auto value = arg->codegen(context);
      if (!(value->getType()->isIntegerTy(8) || value->getType()->isIntegerTy(32)))
        throw CodegenException("incompatible type in pred(): expected char, int");
      if (value->getType()->isIntegerTy(32))
        return context.builder.CreateSub(value, context.builder.getInt32(1));
      else
        return context.builder.CreateSub(value, context.builder.getInt8(1));
    }
    case SysRoutine::SUCC: {
      //只支持字符和整数
      if (args->children().size() != 1) throw CodegenException("no matching function for call to 'succ'");
      auto arg = *args->children().begin();
      auto value = arg->codegen(context);
      if (!(value->getType()->isIntegerTy(8) || value->getType()->isIntegerTy(32)))
        throw CodegenException("incompatible type in succ(): expected char, int");
      if (value->getType()->isIntegerTy(32))
        return context.builder.CreateAdd(value, context.builder.getInt32(1));
      else
        return context.builder.CreateAdd(value, context.builder.getInt8(1));
    }
    case SysRoutine::CHR: {
      if (args->children().size() != 1) throw CodegenException("no matching function for call to 'chr'");
      auto arg = *args->children().begin();
      auto value = arg->codegen(context);
      if (!value->getType()->isIntegerTy(32)) throw CodegenException("incompatible type in chr(): expected int");
      return context.builder.CreateTrunc(value, context.builder.getInt8Ty());
    }
    default:
      throw CodegenException("unsupported built-in routine: " + to_string(routine->routine));
  }
  return nullptr;
}

/* -------- type nodes -------- */
static llvm::Type *llvm_type(Type type, CodegenContext &context) {
  switch (type) {
    case Type::BOOLEN:
      return context.builder.getInt1Ty();
    case Type::INTEGER:
      return context.builder.getInt32Ty();
    case Type::REAL:
      return context.builder.getDoubleTy();
    case Type::CHAR:
      return context.builder.getInt8Ty();
    default:
      return nullptr;
  }
}
static llvm::Type *llvm_type(Type type, int length, CodegenContext &context) {
  return llvm::ArrayType::get(llvm_type(type, context), length);
}
llvm::Type *ConstValueNode::get_llvm_type(CodegenContext &context) const { return this->type->get_llvm_type(context); }

llvm::Type *TypeNode::get_llvm_type(CodegenContext &context) const {
  if (auto *simple_type = dynamic_cast<const SimpleTypeNode *>(this)) {
    return llvm_type(simple_type->type, context);
  }else if (auto *array_type = dynamic_cast<const ArrayTypeNode *>(this)){
    auto length = array_type->bounds.second - array_type->bounds.first;
    return llvm_type(array_type->elementType->type, length, context);
  }

  throw CodegenException("unsupported type: " + type2string(type));
  return nullptr;  // 这里永远不会运行
}

/* -------- routine nodes -------- */
llvm::Value *ProgramNode::codegen(CodegenContext &context) {
  context.is_subroutine = false;
  head_list->const_list->codegen(context);
  head_list->type_list->codegen(context);
  head_list->var_list->codegen(context);

  /*
  context.is_subroutine = true;
  head_list->subroutine_list->codegen(context);
  */
  context.is_subroutine = false;

  auto *func_type = llvm::FunctionType::get(context.builder.getInt32Ty(), false);
  auto *main_func = llvm::Function::Create(func_type, llvm::Function::ExternalLinkage, "main", context.module.get());
  auto *block = llvm::BasicBlock::Create(context.module->getContext(), "cond", main_func);
  context.builder.SetInsertPoint(block);
  for (auto &stmt : children()) stmt->codegen(context);
  context.builder.CreateRet(context.builder.getInt32(0));

  llvm::verifyFunction(*main_func);
  if (context.fpm) {
    context.fpm->run(*main_func);
  }
  if (context.mpm) {
    context.mpm->run(*context.module);
  }
  return nullptr;
}

llvm::Value *HeadListNode::codegen(CodegenContext &context) {
  const_list->codegen(context);
  type_list->codegen(context);
  var_list->codegen(context);
  // subroutine_list->codegen(context);
  return nullptr;
}

/* -------- identifier nodes -------- */
llvm::Value *IdentifierNode::get_ptr(CodegenContext &context) {
  auto value = context.symbolTable.getLocalSymbol(name);
  if (value == nullptr) value = context.symbolTable.getGlobalSymbol(name);
  if (value == nullptr) throw CodegenException("identifier not found: " + name);
  return value->get_llvmptr();
}
llvm::Type *IdentifierNode::get_llvmtype(CodegenContext &context) {
  auto value = context.symbolTable.getLocalSymbol(name);
  if (value == nullptr) value = context.symbolTable.getGlobalSymbol(name);
  if (value == nullptr) throw CodegenException("identifier not found: " + name);
  return value->get_llvmtype(context);
}

llvm::Value *IdentifierNode::codegen(CodegenContext &context) { return context.builder.CreateLoad(get_ptr(context)); }

llvm::Value *ArrayRefNode::codegen(CodegenContext &context) {
  return context.builder.CreateLoad(context.builder.CreateGEP(get_ptr(context),context.builder.getInt32(index)));
}
llvm::Type *ArrayRefNode::get_element_type(CodegenContext &context) {
  auto value = context.symbolTable.getLocalSymbol(name);
  if (value == nullptr) value = context.symbolTable.getGlobalSymbol(name);
  if (value == nullptr) throw CodegenException("identifier not found: " + name);
  return value->get_elementtype(context); }

/* -------- stmt nodes -------- */
llvm::Value *AssignStmtNode::codegen(CodegenContext &context) {
  auto assignee = cast_node<LeftValueExprNode>(this->lhs);
  auto *lhs = assignee->get_ptr(context);
  auto *rhs = this->rhs->codegen(context);
  auto *lhs_type = lhs->getType()->getPointerElementType();
  auto *rhs_type = rhs->getType();
  if (lhs_type->isDoubleTy() && rhs_type->isIntegerTy(32)) {
    rhs = context.builder.CreateSIToFP(rhs, context.builder.getDoubleTy());
  } else if (!((lhs_type->isIntegerTy(1) && rhs_type->isIntegerTy(1)) ||
               (lhs_type->isIntegerTy(8) && rhs_type->isIntegerTy(8)) ||
               (lhs_type->isIntegerTy(32) && rhs_type->isIntegerTy(32)) ||
               (lhs_type->isDoubleTy() && rhs_type->isDoubleTy()))) {
    throw CodegenException("incompatible type in assignments: " + assignee->name);
  }
  context.builder.CreateStore(rhs, lhs);
  return nullptr;
}

llvm::Value *ProcStmtNode::codegen(CodegenContext &context) {
  proc_call->codegen(context);
  return nullptr;
}

llvm::Value *IfStmtNode::codegen(CodegenContext &context) {
  llvm::Value *CondV = cond->codegen(context);
  CondV = context.builder.CreateFCmpONE(
      CondV, llvm::ConstantFP::get(context.builder.getDoubleTy(), 0.0), "ifcond");

  llvm::Function *TheFunction = context.builder.GetInsertBlock()->getParent();
  llvm::BasicBlock *ThenBB =
      llvm::BasicBlock::Create(context.module->getContext(), "then", TheFunction);
  llvm::BasicBlock *ElseBB = llvm::BasicBlock::Create(context.module->getContext(), "else");
  llvm::BasicBlock *MergeBB = llvm::BasicBlock::Create(context.module->getContext(), "merge");
  context.builder.CreateCondBr(CondV, ThenBB, ElseBB);

  context.builder.SetInsertPoint(ThenBB);
  then_stmt->codegen(context);
  context.builder.CreateBr(MergeBB);
  // ThenBB = context.builder.GetInsertBlock();

  TheFunction->getBasicBlockList().push_back(ElseBB);
  context.builder.SetInsertPoint(ElseBB);
  else_stmt->codegen(context);
  context.builder.CreateBr(MergeBB);
  // ElseBB = context.builder.GetInsertBlock();

  TheFunction->getBasicBlockList().push_back(MergeBB);
  context.builder.SetInsertPoint(MergeBB);
/*  llvm::PHINode *PN =
      context.builder.CreatePHI(context.builder.getDoubleTy(), 2, "iftmp");
  PN->addIncoming(ThenV, ThenBB);
  PN->addIncoming(ElseV, ElseBB);
  return PN;*/
  return nullptr;
}

llvm::Value *CaseStmtNode::codegen(CodegenContext &context) {
  llvm::Value *CondV = cond->codegen(context);

  llvm::Function *TheFunction = context.builder.GetInsertBlock()->getParent();
  llvm::BasicBlock *DefaultBB =
      llvm::BasicBlock::Create(context.module->getContext(), "default", TheFunction);
  llvm::BasicBlock *MergeBB =
      llvm::BasicBlock::Create(context.module->getContext(), "merge", TheFunction);
  auto switch_case = context.builder.CreateSwitch(CondV, DefaultBB, body.size());
  for (auto branch : body) {
    auto BranchBB = llvm::BasicBlock::Create(context.module->getContext(), "branch", TheFunction);
    context.builder.SetInsertPoint(BranchBB);
    branch->stmt->codegen(context);
    context.builder.CreateBr(MergeBB);
    //暂时只支持int, char
    if (is_a_ptr_of<IntegerNode>(branch->cond)){
      auto int_case = cast_node<IntegerNode>(branch->cond);
      switch_case->addCase(context.builder.getInt32(int_case->val), BranchBB);
    }else if (is_a_ptr_of<CharNode>(branch->cond)){
      auto char_case = cast_node<CharNode>(branch->cond);
      switch_case->addCase(context.builder.getInt32((int)char_case->val), BranchBB);
    }
  }
  context.builder.SetInsertPoint(DefaultBB);
  default_stmt->codegen(context);
  context.builder.CreateBr(MergeBB);

  context.builder.SetInsertPoint(MergeBB);
  return nullptr;
}

std::string type2string(CodegenContext &context, llvm::Type *type){
  if (type->isIntegerTy(8))
    return "char";
  else if (type->isIntegerTy(32))
    return "integer";
  else if (type->isDoubleTy())
    return "double";
}

llvm::Value *LoopStmtNode::codegen(CodegenContext &context) {
  if (type == LoopType::REPEAT) loop_stmt->codegen(context);

  llvm::Value *CondV = cond->codegen(context);
  llvm::Value *EndV = nullptr;
  llvm::Value *index = nullptr;
  if (type == LoopType::FOR || type == LoopType::FORDOWN){
    index = i->codegen(context);
    if (CondV->getType() != index->getType())
      throw CodegenException("incompatible type in assignments: " + i->name);
    EndV = bound->codegen(context);
    if (EndV->getType() != CondV->getType())
      throw CodegenException("incompatible type in for-do: read " + type2string(context, EndV->getType())
                             + ", expected " + type2string(context, CondV->getType()));
    context.builder.CreateStore(CondV, index);
    if (type == LoopType::FOR)  CondV = context.builder.CreateICmpSGT(index, EndV);
    else  CondV = context.builder.CreateICmpSLT(index, EndV);
  }
  llvm::Function *TheFunction = context.builder.GetInsertBlock()->getParent();
  llvm::BasicBlock *LoopBB = llvm::BasicBlock::Create(context.module->getContext(), "loop", TheFunction);
  llvm::BasicBlock *AfterBB =
        llvm::BasicBlock::Create(context.module->getContext(), "end", TheFunction);
  context.builder.CreateCondBr(CondV, AfterBB, LoopBB);

  context.builder.SetInsertPoint(LoopBB);
  loop_stmt->codegen(context);
  if (type == LoopType::REPEAT || type == LoopType::WHILE)
    CondV = cond->codegen(context);
  else {
    llvm::Value *one = llvm::ConstantInt::get(EndV->getType(), 1);
    if (type == LoopType::FOR) {
      context.builder.CreateStore(context.builder.CreateAdd(index, one), index);
      CondV = context.builder.CreateICmpSGT(index, EndV);
    } else {
      context.builder.CreateStore(context.builder.CreateSub(index, one), index);
      CondV = context.builder.CreateICmpSLT(index, EndV);
    }
  }
  context.builder.CreateCondBr(CondV, AfterBB, LoopBB);
  context.builder.SetInsertPoint(AfterBB);
  return nullptr;
}

/* -------- case node -------- */
llvm::Value *CaseNode::codegen(CodegenContext &context) { return nullptr;}

/* -------- const value nodes -------- */
llvm::Value *StringNode::codegen(CodegenContext &context) { return context.builder.CreateGlobalStringPtr(val); }
llvm::Value *BoolenNode::codegen(CodegenContext &context) {
  return val == true ? context.builder.getTrue() : context.builder.getFalse();
}
llvm::Value *RealNode::codegen(CodegenContext &context) {
  auto *type = context.builder.getDoubleTy();
  return llvm::ConstantFP::get(type, val);
}
llvm::Value *IntegerNode::codegen(CodegenContext &context) {
  auto *type = context.builder.getInt32Ty();
  return llvm::ConstantInt::getSigned(type, val);
}
llvm::Value *CharNode::codegen(CodegenContext &context) { return context.builder.getInt8(static_cast<uint8_t>(val)); }

/* -------- decl nodes -------- */
llvm::Value *ConstListNode::codegen(CodegenContext &context) {
  for (auto &child : children()) child->codegen(context);
  return nullptr;
}
llvm::Value *ConstDeclNode::codegen(CodegenContext &context) {
  if (context.is_subroutine) {
    bool success = context.symbolTable.addLocalSymbol(name->name, value->type, true);
    if (!success) throw CodegenException("duplicate identifier in const section: " + name->name);
    auto local = context.symbolTable.getLocalSymbol(name->name);
    context.builder.CreateStore(value->codegen(context), local->get_llvmptr());
    return local->get_llvmptr();
  } else {
    if (is_a_ptr_of<StringNode>(value))  //符号表字符串的支持还有问题，先在这打个洞吧...
      return value->codegen(context);
    auto *constant = llvm::cast<llvm::Constant>(value->codegen(context));  //获得初值
    bool success = context.symbolTable.addGlobalSymbol(name->name, value->type, constant, true);
    return context.symbolTable.getGlobalSymbol(name->name)->get_llvmptr();
  }
}

llvm::Value *VarListNode::codegen(CodegenContext &context) {
  for (auto &child : children()) child->codegen(context);
  return nullptr;
}

llvm::Value *VarDeclNode::codegen(CodegenContext &context) {
  if (context.is_subroutine)  //如果是子过程 分配临时变量
  {
    bool success = context.symbolTable.addLocalSymbol(name->name, type);
    if (!success) throw CodegenException("duplicate identifier in var section: " + name->name);
    auto local = context.symbolTable.getLocalSymbol(name->name);
    return local->get_llvmptr();
  } else {
    bool success = context.symbolTable.addGlobalSymbol(name->name, type, nullptr);
    if (!success) throw CodegenException("duplicate global identifier in var sectrion: " + name->name);
    auto ptr = context.symbolTable.getGlobalSymbol(name->name)->get_llvmptr();
    return ptr;
  }
}

llvm::Value *TypeListNode::codegen(CodegenContext &context) {
  for (auto &child : children()) child->codegen(context);
  return nullptr;
}

llvm::Value *TypeDefNode::codegen(CodegenContext &context) {
  if (context.is_subroutine) {
    bool success = context.symbolTable.addLocalAlias(name->name, type);
    if (!success) throw CodegenException(fmt::format("duplicate local type alias: \"{}\"", name->name));
  } else {
    bool success = context.symbolTable.addGlobalAlias(name->name, type);
    if (!success) throw CodegenException(fmt::format("duplicate global type alias: \"{}\"", name->name));
  }
  return nullptr;
}

/* -------- expr nodes -------- */
llvm::Value *BinopExprNode::codegen(CodegenContext &context) {
  auto *lhs = this->lhs->codegen(context);
  auto *rhs = this->rhs->codegen(context);
  if (lhs->getType()->isIntegerTy(1) && rhs->getType()->isIntegerTy(1)) {
    llvm::CmpInst::Predicate cmp;
    switch (op) {
      case BinaryOperator::GT:
        cmp = llvm::CmpInst::ICMP_SGT;
        break;
      case BinaryOperator::GE:
        cmp = llvm::CmpInst::ICMP_SGE;
        break;
      case BinaryOperator::LT:
        cmp = llvm::CmpInst::ICMP_SLT;
        break;
      case BinaryOperator::LE:
        cmp = llvm::CmpInst::ICMP_SLE;
        break;
      case BinaryOperator::EQ:
        cmp = llvm::CmpInst::ICMP_EQ;
        break;
      case BinaryOperator::NE:
        cmp = llvm::CmpInst::ICMP_NE;
        break;
      default:
        cmp = llvm::CmpInst::FCMP_FALSE;
    }
    if (cmp != llvm::CmpInst::FCMP_FALSE) return context.builder.CreateICmp(cmp, lhs, rhs);
    llvm::Instruction::BinaryOps binop;
    switch (op) {
      case BinaryOperator::AND:
        binop = llvm::Instruction::And;
        break;
      case BinaryOperator::OR:
        binop = llvm::Instruction::Or;
        break;
      case BinaryOperator::XOR:
        binop = llvm::Instruction::Xor;
        break;
      default:
        throw CodegenException("operator is invalid: boolean " + to_string(op) + " boolean");
    }
    return context.builder.CreateBinOp(binop, lhs, rhs);
  } else if (lhs->getType()->isIntegerTy(32) && rhs->getType()->isIntegerTy(32)) {
    llvm::CmpInst::Predicate cmp;
    switch (op) {
      case BinaryOperator::GT:
        cmp = llvm::CmpInst::ICMP_SGT;
        break;
      case BinaryOperator::GE:
        cmp = llvm::CmpInst::ICMP_SGE;
        break;
      case BinaryOperator::LT:
        cmp = llvm::CmpInst::ICMP_SLT;
        break;
      case BinaryOperator::LE:
        cmp = llvm::CmpInst::ICMP_SLE;
        break;
      case BinaryOperator::EQ:
        cmp = llvm::CmpInst::ICMP_EQ;
        break;
      case BinaryOperator::NE:
        cmp = llvm::CmpInst::ICMP_NE;
        break;
      default:
        cmp = llvm::CmpInst::FCMP_FALSE;
    }
    if (cmp != llvm::CmpInst::FCMP_FALSE) return context.builder.CreateICmp(cmp, lhs, rhs);
    llvm::Instruction::BinaryOps binop;
    switch (op) {
      case BinaryOperator::ADD:
        binop = llvm::Instruction::Add;
        break;
      case BinaryOperator::SUB:
        binop = llvm::Instruction::Sub;
        break;
      case BinaryOperator::MUL:
        binop = llvm::Instruction::Mul;
        break;
      case BinaryOperator::DIV:
        binop = llvm::Instruction::SDiv;
        break;
      case BinaryOperator::MOD:
        binop = llvm::Instruction::SRem;
        break;
      case BinaryOperator::AND:
        binop = llvm::Instruction::And;
        break;
      case BinaryOperator::OR:
        binop = llvm::Instruction::Or;
        break;
      case BinaryOperator::XOR:
        binop = llvm::Instruction::Xor;
        break;
      case BinaryOperator::TRUEDIV:
        lhs = context.builder.CreateSIToFP(lhs, context.builder.getDoubleTy());
        rhs = context.builder.CreateSIToFP(rhs, context.builder.getDoubleTy());
        binop = llvm::Instruction::FDiv;
        break;
      default:
        throw CodegenException("operator is invalid: integer " + to_string(op) + " integer");
    }
    return context.builder.CreateBinOp(binop, lhs, rhs);
  } else if (lhs->getType()->isDoubleTy() || rhs->getType()->isDoubleTy()) {
    if (lhs->getType()->isIntegerTy(32)) lhs = context.builder.CreateSIToFP(lhs, context.builder.getDoubleTy());
    if (rhs->getType()->isIntegerTy(32)) rhs = context.builder.CreateSIToFP(rhs, context.builder.getDoubleTy());
    llvm::CmpInst::Predicate cmp;
    switch (op) {
      case BinaryOperator::GT:
        cmp = llvm::CmpInst::FCMP_OGT;
        break;
      case BinaryOperator::GE:
        cmp = llvm::CmpInst::FCMP_OGE;
        break;
      case BinaryOperator::LT:
        cmp = llvm::CmpInst::FCMP_OLT;
        break;
      case BinaryOperator::LE:
        cmp = llvm::CmpInst::FCMP_OLE;
        break;
      case BinaryOperator::EQ:
        cmp = llvm::CmpInst::FCMP_OEQ;
        break;
      case BinaryOperator::NE:
        cmp = llvm::CmpInst::FCMP_ONE;
        break;
      default:
        cmp = llvm::CmpInst::FCMP_FALSE;
    }
    if (cmp != llvm::CmpInst::FCMP_FALSE) return context.builder.CreateFCmp(cmp, lhs, rhs);
    llvm::Instruction::BinaryOps binop;
    switch (op) {
      case BinaryOperator::ADD:
        binop = llvm::Instruction::FAdd;
        break;
      case BinaryOperator::SUB:
        binop = llvm::Instruction::FSub;
        break;
      case BinaryOperator::MUL:
        binop = llvm::Instruction::FMul;
        break;
      case BinaryOperator::TRUEDIV:
        binop = llvm::Instruction::FDiv;
        break;
      default:
        throw CodegenException("operator is invalid: real " + to_string(op) + " real");
    }
    return context.builder.CreateBinOp(binop, lhs, rhs);
  } else if (lhs->getType()->isIntegerTy(8) && rhs->getType()->isIntegerTy(8)) {
    llvm::CmpInst::Predicate cmp;
    switch (op) {
      case BinaryOperator::GT:
        cmp = llvm::CmpInst::ICMP_SGT;
        break;
      case BinaryOperator::GE:
        cmp = llvm::CmpInst::ICMP_SGE;
        break;
      case BinaryOperator::LT:
        cmp = llvm::CmpInst::ICMP_SLT;
        break;
      case BinaryOperator::LE:
        cmp = llvm::CmpInst::ICMP_SLE;
        break;
      case BinaryOperator::EQ:
        cmp = llvm::CmpInst::ICMP_EQ;
        break;
      case BinaryOperator::NE:
        cmp = llvm::CmpInst::ICMP_NE;
        break;
      default:
        throw CodegenException("operator is invalid: char " + to_string(op) + " char");
    }
    return context.builder.CreateICmp(cmp, lhs, rhs);
  } else {
    throw CodegenException("operator is invalid: " + to_string(op) + " between different types");
  }
}

llvm::Value *FuncExprNode::codegen(CodegenContext &context) { return func_call->codegen(context); }
}  // namespace spc
