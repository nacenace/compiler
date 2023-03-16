#include <llvm/IR/Constants.h>
#include <llvm/IR/DerivedTypes.h>
#include <llvm/IR/Type.h>
// used by routine nodes
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Verifier.h>

#include <llvm/Support/Casting.h>
#include "context.hpp"
#include "symbol.hpp"

namespace spc {
/* -------- syscall nodes -------- */
llvm::Value *SysCallNode::codegen(CodegenContext &context) {
  if (routine->routine == SysRoutine::WRITELN || routine->routine == SysRoutine::WRITE) {
    auto char_ptr = context.builder.getInt8Ty()->getPointerTo();
    auto printf_type = llvm::FunctionType::get(context.builder.getInt32Ty(), char_ptr, true);
    auto printf_func = context.module->getOrInsertFunction("printf", printf_type);
    for (auto &arg : args->children()) {
      auto value = arg->codegen(context);
      std::vector<llvm::Value *> args;
      if (value->getType()->isIntegerTy(8)) {
        args.push_back(context.builder.CreateGlobalStringPtr("%c"));
        args.push_back(value);
      } else if (value->getType()->isIntegerTy()) {
        args.push_back(context.builder.CreateGlobalStringPtr("%d"));
        args.push_back(value);
      } else if (value->getType()->isDoubleTy()) {
        args.push_back(context.builder.CreateGlobalStringPtr("%f"));
        args.push_back(value);
      }
      // Pascal pointers are not supported, so this is an LLVM global string pointer.
      else if (value->getType()->isPointerTy()) {
        args.push_back(value);
      } else {
        throw CodegenException("incompatible type in write(): expected char, integer, real");
      }
      context.builder.CreateCall(printf_func, args);
    }
    if (routine->routine == SysRoutine::WRITELN) {
      context.builder.CreateCall(printf_func, context.builder.CreateGlobalStringPtr("\n"));
    }
    return nullptr;
  } else {
    throw CodegenException("unsupported built-in routine: " + to_string(routine->routine));
  }
}

/* -------- type nodes -------- */
static llvm::Type *llvm_type(Type type, CodegenContext &context) {
  switch (type) {
    default:
      return nullptr;
  }
}

llvm::Type *TypeNode::get_llvm_type(CodegenContext &context) const {
  if (auto *simple_type = dynamic_cast<const SimpleTypeNode *>(this)) {
    return llvm_type(simple_type->type, context);
  }

  throw CodegenException("unsupported type: " + type2string(type));
  return nullptr;  // 这里永远不会运行
}

/* -------- routine nodes -------- */
llvm::Value *ProgramNode::codegen(CodegenContext &context) {
  /*
  context.is_subroutine = false;
  head_list->const_list->codegen(context);
  head_list->type_list->codegen(context);
  head_list->var_list->codegen(context);

  context.is_subroutine = true;
  head_list->subroutine_list->codegen(context);
  */
  context.is_subroutine = false;

  auto *func_type = llvm::FunctionType::get(context.builder.getInt32Ty(), false);
  auto *main_func = llvm::Function::Create(func_type, llvm::Function::ExternalLinkage, "main", context.module.get());
  auto *block = llvm::BasicBlock::Create(context.module->getContext(), "entry", main_func);
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

/* -------- identifier nodes -------- */
llvm::Value *IdentifierNode::get_ptr(CodegenContext &context) {
  auto value = context.symbolTable.getLocalSymbol(name);
  if (value == nullptr) value = context.symbolTable.getGlobalSymbol(name);
  if (value == nullptr) throw CodegenException("identifier not found: " + name);
  return value->get_llvmptr();
}

llvm::Value *IdentifierNode::codegen(CodegenContext &context) { return context.builder.CreateLoad(get_ptr(context)); }

/* -------- stmt nodes -------- */
llvm::Value *ProcStmtNode::codegen(CodegenContext &context) {
  proc_call->codegen(context);
  return nullptr;
}

/* -------- const value nodes -------- */
llvm::Value *StringNode::codegen(CodegenContext &context) { return context.builder.CreateGlobalStringPtr(val); }
}  // namespace spc
