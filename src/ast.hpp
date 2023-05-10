#ifndef AST_H
#define AST_H

#include <llvm/IR/Value.h>
#include <algorithm>
#include <cassert>
#include <iostream>
#include <list>
#include <locale>
#include <map>
#include <memory>
#include <string>
#include <type_traits>
#include <typeinfo>
#include <utility>
#include <vector>

namespace spc {
// 顶层类
struct AbstractNode;
struct DummyNode;
struct ExprNode;
struct LeftValueExprNode;
struct StmtNode;
struct IdentifierNode;
// type def
struct TypeNode;
struct SimpleTypeNode;
struct StringTypeNode;
struct AliasTypeNode;
struct ArrayTypeNode;
struct ConstValueNode;
// 字面量相关
struct StringNode;
struct RealNode;
struct IntegerNode;
struct CharNode;
struct BoolenNode;
// 表达式相关
struct BinopExprNode;
struct FuncExprNode;
struct SysRoutineNode;
struct SysCallNode;
struct ArgListNode;
struct ParamDeclNode;
struct ParamListNode;
struct VarDeclNode;
struct VarListNode;
struct ConstDeclNode;
struct ConstListNode;
struct TypeDefNode;
struct TypeListNode;
// 结构语句相关
struct NameListNode;
struct RoutineCallNode;
struct SubroutineListNode;
struct HeadListNode;
struct RoutineNode;
struct ProgramNode;
struct SubroutineNode;
struct CompoundStmtNode;
struct AssignStmtNode;
struct ProcStmtNode;
struct StmtList;

struct CodegenContext;

template <typename NodeType>
bool is_a_ptr_of(const std::shared_ptr<AbstractNode> &ptr) {
  auto _p = ptr.get();
  return dynamic_cast<NodeType *>(_p) != nullptr;
}

inline std::shared_ptr<AbstractNode> wrap_node(AbstractNode *node) { return std::shared_ptr<AbstractNode>{node}; }

template <typename TNode>
typename std::enable_if<std::is_base_of<AbstractNode, TNode>::value, std::shared_ptr<TNode>>::type cast_node(
    const std::shared_ptr<AbstractNode> &node) {
  if (is_a_ptr_of<TNode>(node)) return std::dynamic_pointer_cast<TNode>(node);
  assert(is_a_ptr_of<TNode>(node));
  return nullptr;
}

template <typename NodeType, typename... Args>
std::shared_ptr<AbstractNode> make_node(Args &&... args) {
  return std::dynamic_pointer_cast<AbstractNode>(std::make_shared<NodeType>(std::forward<Args>(args)...));
};

struct AbstractNode : public std::enable_shared_from_this<AbstractNode> {
  std::list<std::shared_ptr<AbstractNode>> _children;
  std::weak_ptr<AbstractNode> _parent;

  virtual ~AbstractNode() noexcept = default;
  virtual llvm::Value *codegen(CodegenContext &context) = 0;
  void print_json() const;
  std::string to_json() const;
  std::list<std::shared_ptr<AbstractNode>> &children() noexcept {
    assert(this->should_have_children());
    return this->_children;
  }
  auto &parent() noexcept { return this->_parent; }
  virtual void add_child(const std::shared_ptr<AbstractNode> &node) {
    this->_children.push_back(node);
    node->parent() = this->shared_from_this();
  }
  virtual void add_child(std::shared_ptr<AbstractNode> &&node) {
    this->_children.push_back(node);
    node->parent() = this->shared_from_this();
  }
  void merge_children(const std::list<std::shared_ptr<AbstractNode>> &children) {
    for (const auto &e : children) {
      this->add_child(e);
    }
  }
  void lift_children(const std::shared_ptr<AbstractNode> &node) { this->merge_children(node->children()); }
  virtual bool should_have_children() const { return true; }
  virtual std::string json_head() const = 0;
};

struct DummyNode : public AbstractNode {
 public:
  std::string json_head() const override { return std::string{"\"type\": \"<unspecified-from-dummy>\""}; }

  llvm::Value *codegen(CodegenContext &context) override {
    std::cout << typeid(*this).name() << std::endl;
    assert(false);
    return nullptr;
  }
};

struct ExprNode : public DummyNode {
  std::shared_ptr<TypeNode> type;

 protected:
  ExprNode() = default;
};

struct LeftValueExprNode : public ExprNode {
  virtual llvm::Value *get_ptr(CodegenContext &context) = 0;
  std::string name;
};

struct StmtNode : public DummyNode {
 protected:
  StmtNode() = default;
};

struct IfStmtNode : public StmtNode {
 public:
  std::shared_ptr<ExprNode> cond;
  std::shared_ptr<StmtNode> then_stmt;
  std::shared_ptr<StmtNode> else_stmt;

  IfStmtNode(const std::shared_ptr<AbstractNode> &cond, const std::shared_ptr<AbstractNode> &then_stmt,
             const std::shared_ptr<AbstractNode> &else_stmt = nullptr)
      : cond(cast_node<ExprNode>(cond)),
        then_stmt(cast_node<StmtNode>(then_stmt)),
        else_stmt(else_stmt ? cast_node<StmtNode>(else_stmt) : nullptr) {}

  llvm::Value *codegen(CodegenContext &context) override;

 protected:
  bool should_have_children() const override { return false; }
  std::string json_head() const override {
    return std::string{"\"type\": \"IfStmtNode\", \"cond\": "} + this->cond->to_json() +
           ", \"then_stmt\": " + this->then_stmt->to_json() +
           (else_stmt ? (", \"else_stmt\": " + this->else_stmt->to_json()) : "");
  }
};

struct IdentifierNode : public LeftValueExprNode {
 public:
  explicit IdentifierNode(const char *c) {
    name = std::string(c);
    std::transform(name.begin(), name.end(), name.begin(),
                   [](unsigned char c) { return std::tolower(c); });  // 为了忽略大小写，所以全部转为小写
  }

  llvm::Value *get_ptr(CodegenContext &context) override;
  llvm::Type *get_llvmtype(CodegenContext &context);
  llvm::Value *codegen(CodegenContext &context) override;

 protected:
  std::string json_head() const override {
    return std::string{"\"type\": \"Identifier\", \"name\": \""} + this->name + "\"";
  }

  bool should_have_children() const override { return false; }
};

struct ArrayRefNode : public IdentifierNode {
 public:
  int index;
  std::shared_ptr<ExprNode> i = nullptr;
  explicit ArrayRefNode(const char *c, const int index) : IdentifierNode(c), index(index) {}
  explicit ArrayRefNode(const char *c, const std::shared_ptr<AbstractNode> &i)
      : IdentifierNode(c), i(cast_node<ExprNode>(i)) {}

  llvm::Value *get_ptr(CodegenContext &context) override;
  llvm::Value *codegen(CodegenContext &context) override;
  llvm::Value *get_index(CodegenContext &context);

 protected:
  std::string json_head() const override {
    return std::string{"\"type\": \"ArrayRefNode\", \"name\": \""} + this->name + "\"";
  }
};

struct StructRefNode : public IdentifierNode {
 public:
  std::shared_ptr<IdentifierNode> index;
  explicit StructRefNode(const char *c, const std::shared_ptr<IdentifierNode> index) : IdentifierNode(c), index(index) {}

  llvm::Value *get_ptr(CodegenContext &context) override;
  llvm::Value *codegen(CodegenContext &context) override;

 protected:
  std::string json_head() const override {
    return std::string{"\"type\": \"ArrayRefNode\", \"name\": \""} + this->name + "\"";
  }
};
enum class LoopType { REPEAT, WHILE, FOR, FORDOWN };

inline std::string to_string(LoopType loopType) {
  std::map<LoopType, std::string> loop_to_string{{LoopType::REPEAT, "Repeat"},
                                                 {LoopType::WHILE, "While"},
                                                 {LoopType::FOR, "for"},
                                                 {LoopType::FORDOWN, "for_down"}};
  return loop_to_string[loopType];
}

struct LoopStmtNode : public StmtNode {
 public:
  LoopType type;
  std::shared_ptr<IdentifierNode> i;
  std::shared_ptr<ExprNode> cond;
  std::shared_ptr<ExprNode> bound;
  std::shared_ptr<StmtNode> loop_stmt;

  LoopStmtNode(LoopType type, const std::shared_ptr<AbstractNode> &cond, const std::shared_ptr<AbstractNode> &loop_stmt)
      : type(type), cond(cast_node<ExprNode>(cond)), loop_stmt(cast_node<StmtNode>(loop_stmt)) {}

  LoopStmtNode(LoopType type, const std::shared_ptr<AbstractNode> &cond, const std::shared_ptr<AbstractNode> &loop_stmt,
               std::shared_ptr<AbstractNode> &i, const std::shared_ptr<AbstractNode> &bound)
      : type(type),
        cond(cast_node<ExprNode>(cond)),
        loop_stmt(cast_node<StmtNode>(loop_stmt)),
        i(cast_node<IdentifierNode>(i)),
        bound(cast_node<ExprNode>(bound)) {}

  llvm::Value *codegen(CodegenContext &context) override;

 protected:
  bool should_have_children() const override { return false; }
  std::string json_head() const override {
    if (type == LoopType::FOR || type == LoopType::FORDOWN)
      return std::string{"\"type\": \"" + to_string(type) + "StmtNode\", \"head\": Identifier "} + this->i->name +
             " from " + this->cond->to_json() + " to " + this->bound->to_json() +
             "\", \"stmt\": " + this->loop_stmt->to_json();
    else
      return std::string{"\"type\": \"" + to_string(type) + "StmtNode\", \"expr\": "} + this->cond->to_json() +
             ", \"stmt\": " + this->loop_stmt->to_json();
  }
};

enum class Type {
  /// 未定义
  UNDEFINED,
  VOID,
  /// 字符串
  STRING,
  BOOLEN,
  INTEGER,
  REAL,
  CHAR,
  ARRAY,
  STRUCT
};

std::string type2string(Type type);

struct TypeNode : public DummyNode {
  Type type = Type::UNDEFINED;
  llvm::Type *get_llvm_type(CodegenContext &context) const;

  TypeNode() = default;
  virtual std::string json_head() const = 0;
  virtual bool should_have_children() const = 0;
};

struct SimpleTypeNode : public TypeNode {
  using TypeNode::type;
  SimpleTypeNode(Type type) { this->type = type; }
  virtual std::string json_head() const override;
  virtual bool should_have_children() const override { return false; }
};

struct StringTypeNode : public TypeNode {
 public:
  StringTypeNode() { type = Type::STRING; }
  virtual std::string json_head() const override;
  virtual bool should_have_children() const override { return false; }
};

struct AliasTypeNode : public TypeNode {
 public:
  using NodePtr = std::shared_ptr<AbstractNode>;
  std::shared_ptr<IdentifierNode> identifier;

  AliasTypeNode(const NodePtr &identifier) : identifier(cast_node<IdentifierNode>(identifier)) {}
  virtual std::string json_head() const override;
  virtual bool should_have_children() const override { return false; }
};

struct ArrayTypeNode : public TypeNode {
 public:
  std::shared_ptr<TypeNode> elementType;
  //存储各维度的上下界，非整数形式的上下界转换为整数存储
  std::pair<int, int> bounds;
  ArrayTypeNode(const std::shared_ptr<AbstractNode> &elementType, std::pair<int, int> bounds)
      : elementType(cast_node<TypeNode>(elementType)), bounds(bounds) {
    type = Type::ARRAY;
  }
  virtual std::string json_head() const override;
  virtual bool should_have_children() const override { return false; }
};

struct ConstValueNode : public ExprNode {
 public:
  llvm::Type *get_llvm_type(CodegenContext &context) const;

 protected:
  ConstValueNode() { type = nullptr; }

  bool should_have_children() const final { return false; }
};

struct StringNode : public ConstValueNode {
 public:
  std::string val;

  StringNode(const char *val) : val(val) {
    this->val.erase(this->val.begin());
    this->val.pop_back();
    type = std::make_shared<SimpleTypeNode>(Type::STRING);
  }

  llvm::Value *codegen(CodegenContext &context) override;

 protected:
  std::string json_head() const override { return std::string{"\"type\": \"String\", \"value\": \""} + val + "\""; }
};

struct BoolenNode : public ConstValueNode {
 public:
  bool val;

  BoolenNode(const bool val) : val(val) { type = std::make_shared<SimpleTypeNode>(Type::BOOLEN); }

  llvm::Value *codegen(CodegenContext &context) override;

 protected:
  std::string json_head() const override {
    return std::string{"\"type\": \"Boolen\", \"value\": \""} + (val == true ? "true" : "false") + "\"";
  }
};

struct RealNode : public ConstValueNode {
 public:
  double val;

  RealNode(const double val) : val(val) { type = std::make_shared<SimpleTypeNode>(Type::REAL); }

  RealNode(const char *val) {
    this->val = atof(val);
    type = std::make_shared<SimpleTypeNode>(Type::REAL);
  }

  llvm::Value *codegen(CodegenContext &context) override;

 protected:
  std::string json_head() const override {
    return std::string{"\"type\": \"Real\", \"value\": \""} + std::to_string(val) + "\"";
  }
};

struct IntegerNode : public ConstValueNode {
 public:
  int val;

  IntegerNode(const int val) : val(val) { type = std::make_shared<SimpleTypeNode>(Type::INTEGER); }

  IntegerNode(const char *val) {
    this->val = atoi(val);
    type = std::make_shared<SimpleTypeNode>(Type::INTEGER);
  }

  llvm::Value *codegen(CodegenContext &context) override;

 protected:
  std::string json_head() const override {
    return std::string{"\"type\": \"Integer\", \"value\": \""} + std::to_string(val) + "\"";
  }
};

struct CharNode : public ConstValueNode {
 public:
  char val;

  CharNode(const char val) : val(val) { type = std::make_shared<SimpleTypeNode>(Type::CHAR); }
  CharNode(const char *val) {
    this->val = *(val + 1);
    type = std::make_shared<SimpleTypeNode>(Type::CHAR);
  }

  llvm::Value *codegen(CodegenContext &context) override;

 protected:
  std::string json_head() const override { return std::string{"\"type\": \"Char\", \"value\": \""} + val + "\""; }
};

struct CaseList : public DummyNode {};

struct CaseNode : public CaseList {
 public:
  std::shared_ptr<ConstValueNode> cond;
  std::shared_ptr<StmtNode> stmt;

  CaseNode(const std::shared_ptr<AbstractNode> &cond, const std::shared_ptr<AbstractNode> &stmt)
      : cond(cast_node<ConstValueNode>(cond)), stmt(cast_node<StmtNode>(stmt)) {}

  llvm::Value *codegen(CodegenContext &context) override;

 protected:
  std::string json_head() const override {
    return std::string{"\"type\": \"CaseNode\", \"cond\": "} + this->cond->to_json() +
           ", \"stmt\": " + this->stmt->to_json();
  }

  bool should_have_children() const override { return false; }
};

struct CaseStmtNode : public StmtNode {
 public:
  std::shared_ptr<ExprNode> cond;
  std::shared_ptr<CaseList> body;
  std::shared_ptr<StmtNode> default_stmt;

  CaseStmtNode(const std::shared_ptr<AbstractNode> &cond, const std::shared_ptr<AbstractNode> &body,
               const std::shared_ptr<AbstractNode> &default_stmt = nullptr)
      : cond(cast_node<ExprNode>(cond)),
        body(cast_node<CaseList>(body)),
        default_stmt(default_stmt ? cast_node<StmtNode>(default_stmt) : nullptr) {}

  llvm::Value *codegen(CodegenContext &context) override;

 protected:
  bool should_have_children() const override { return false; }
  std::string json_head() const override {
    std::string json = "\"type\": \"CaseStmtNode\", \"expr\": " + this->cond->to_json() + ", \"body\": { ";
    for (auto case_stmt : body->children()) {
      case_stmt = cast_node<CaseNode>(case_stmt);
      json += "\"case\": " + case_stmt->to_json() + ',';
    }
    if (default_stmt) json += "\"default_stmt\": " + default_stmt->to_json();
    return json;
  }
};

enum class BinaryOperator { GT, GE, LT, LE, EQ, NE, ADD, SUB, MUL, TRUEDIV, DIV, MOD, AND, OR, XOR };

inline std::string to_string(BinaryOperator binop) {
  std::map<BinaryOperator, std::string> binop_to_string{
      {BinaryOperator::GT, ">"},      {BinaryOperator::GE, ">="},   {BinaryOperator::LT, "<"},
      {BinaryOperator::LE, "<="},     {BinaryOperator::EQ, "="},    {BinaryOperator::NE, "<>"},
      {BinaryOperator::ADD, "+"},     {BinaryOperator::SUB, "-"},   {BinaryOperator::MUL, "*"},
      {BinaryOperator::TRUEDIV, "/"}, {BinaryOperator::DIV, "div"}, {BinaryOperator::MOD, "mod"},
      {BinaryOperator::AND, "and"},   {BinaryOperator::OR, "or"},   {BinaryOperator::XOR, "xor"}};
  // TODO: bound checking
  return binop_to_string[binop];
}

struct BinopExprNode : public ExprNode {
 public:
  BinaryOperator op;
  std::shared_ptr<ExprNode> lhs;
  std::shared_ptr<ExprNode> rhs;

  BinopExprNode(BinaryOperator op, const std::shared_ptr<AbstractNode> &lhs, const std::shared_ptr<AbstractNode> &rhs)
      : op(op), lhs(cast_node<ExprNode>(lhs)), rhs(cast_node<ExprNode>(rhs)) {}

  llvm::Value *codegen(CodegenContext &context) override;

 protected:
  bool should_have_children() const override { return false; }

  std::string json_head() const override {
    return std::string{"\"type\": \"BinopExpr\", \"op\": \""} + to_string(this->op) +
           "\", \"lhs\": " + this->lhs->to_json() + ", \"rhs\": " + this->rhs->to_json();
  }
};

struct FuncExprNode : public ExprNode {
 public:
  std::shared_ptr<AbstractNode> func_call;

  FuncExprNode(const std::shared_ptr<AbstractNode> &func_call) : func_call(func_call) {
    assert(is_a_ptr_of<RoutineCallNode>(func_call) || is_a_ptr_of<SysCallNode>(func_call));
  }

  llvm::Value *codegen(CodegenContext &context) override;

 protected:
  std::string json_head() const override {
    return std::string{"\"type\": \"FuncExpr\", \"call\": "} + this->func_call->to_json();
  }

  bool should_have_children() const override { return false; }
};

enum class SysRoutine {
  /// 输出并回车
  WRITELN,
  WRITE,
  READ,
  READLN,
  SQRT,
  ABS,
  ORD,
  PRED,
  SUCC,
  CHR
};

inline std::string to_string(SysRoutine routine) {
  std::map<SysRoutine, std::string> routine_to_string{{SysRoutine::WRITELN, "writeln"}, {SysRoutine::WRITE, "write"},
                                                      {SysRoutine::READ, "read"},       {SysRoutine::READLN, "readln"},
                                                      {SysRoutine::SQRT, "sqrt"},       {SysRoutine::ABS, "abs"},
                                                      {SysRoutine::ORD, "ord"},         {SysRoutine::PRED, "pred"},
                                                      {SysRoutine::SUCC, "succ"},       {SysRoutine::CHR, "chr"}};
  // TODO: bound checking
  return routine_to_string[routine];
}

struct SysRoutineNode : public DummyNode {
 public:
  SysRoutine routine;

  explicit SysRoutineNode(SysRoutine routine) : routine(routine) {}

 protected:
  bool should_have_children() const override { return false; }
};

struct SysCallNode : public DummyNode {
 public:
  std::shared_ptr<SysRoutineNode> routine;
  std::shared_ptr<ArgListNode> args;

  SysCallNode(const std::shared_ptr<AbstractNode> &routine, const std::shared_ptr<AbstractNode> &args);

  explicit SysCallNode(const std::shared_ptr<AbstractNode> &routine) : SysCallNode(routine, make_node<ArgListNode>()) {}

  llvm::Value *codegen(CodegenContext &context) override;

 protected:
  std::string json_head() const override;

  bool should_have_children() const override { return false; }
};

struct ArgListNode : public DummyNode {
 protected:
  std::string json_head() const override { return std::string{"\"type\": \"ArgList\""}; }

  bool should_have_children() const override { return true; }
};

struct ParamDeclNode : public DummyNode {
 public:
  using NodePtr = std::shared_ptr<AbstractNode>;
  /// 程序名
  std::shared_ptr<IdentifierNode> name;
  /// 返回类型
  std::shared_ptr<TypeNode> type;

  ParamDeclNode(const NodePtr &name, const NodePtr &type)
      : name(cast_node<IdentifierNode>(name)), type(cast_node<TypeNode>(type)) {
    assert(is_a_ptr_of<SimpleTypeNode>(type) || is_a_ptr_of<AliasTypeNode>(type));
  }

 protected:
  std::string json_head() const override {
    return std::string{"\"type\": \"ParamDecl\", \"name\": "} + this->name->to_json() +
           ", \"decl\": " + this->type->to_json();
  }

  bool should_have_children() const override { return false; }
};
/// 程序列表语义节点
struct ParamListNode : public DummyNode {
 protected:
  std::string json_head() const override { return std::string{"\"type\": \"ParamList\""}; }

  bool should_have_children() const override { return true; }
};

/// 变量声明语义节点
struct VarDeclNode : public DummyNode {
 public:
  /// 变量名
  std::shared_ptr<IdentifierNode> name;
  /// 变量类型
  std::shared_ptr<TypeNode> type;
  /// 变量初始值
  std::shared_ptr<ConstValueNode> value;

  VarDeclNode(const std::shared_ptr<AbstractNode> &name, const std::shared_ptr<AbstractNode> &type, const std::shared_ptr<AbstractNode> &value = nullptr)
      : name(cast_node<IdentifierNode>(name)), type(cast_node<TypeNode>(type)), value(value ? cast_node<ConstValueNode>(value) : nullptr) {}

  llvm::Value *codegen(CodegenContext &context) override;

 protected:
  std::string json_head() const override {
    return std::string{"\"type\": \"VarDecl\", \"name\": "} + this->name->to_json() +
           ", \"decl\": " + this->type->to_json();
  }

  bool should_have_children() const override { return false; }
};
/// 变量列表语义节点
struct VarListNode : public DummyNode {
 public:
  llvm::Value *codegen(CodegenContext &context) override;

 protected:
  std::string json_head() const override { return std::string{"\"type\": \"VarList\""}; }

  bool should_have_children() const override { return true; }
};
/// 常量声明语义节点
struct ConstDeclNode : public DummyNode {
 public:
  std::shared_ptr<IdentifierNode> name;
  std::shared_ptr<ConstValueNode> value;

  ConstDeclNode(const std::shared_ptr<AbstractNode> &name, const std::shared_ptr<AbstractNode> &value)
      : name(cast_node<IdentifierNode>(name)), value(cast_node<ConstValueNode>(value)) {}

  llvm::Value *codegen(CodegenContext &context) override;

 protected:
  std::string json_head() const override {
    return std::string{"\"type\": \"ConstDecl\", \"name\": "} + this->name->to_json() +
           ", \"value\": " + this->value->to_json();
  }

  bool should_have_children() const override { return false; }
};
/// 常量列表语义节点
struct ConstListNode : public DummyNode {
 public:
  llvm::Value *codegen(CodegenContext &context) override;

 protected:
  std::string json_head() const override { return std::string{"\"type\": \"ConstList\""}; }

  bool should_have_children() const override { return true; }
};
/// 类型定义语义节点
struct TypeDefNode : public DummyNode {
 public:
  std::shared_ptr<IdentifierNode> name;
  std::shared_ptr<TypeNode> type;

  TypeDefNode(const std::shared_ptr<AbstractNode> &name, const std::shared_ptr<AbstractNode> &type)
      : name(cast_node<IdentifierNode>(name)), type(cast_node<TypeNode>(type)) {}

  llvm::Value *codegen(CodegenContext &context) override;

 protected:
  std::string json_head() const override {
    return std::string{"\"type\": \"TypeDef\", \"name\": "} + this->name->to_json() +
           ", \"alias\": " + this->type->to_json();
  }

  bool should_have_children() const override { return false; }
};
/// 类型列表语义节点
struct TypeListNode : public DummyNode {
 public:
  llvm::Value *codegen(CodegenContext &context) override;

 protected:
  std::string json_head() const override { return std::string{"\"type\": \"TypeList\""}; }

  bool should_have_children() const override { return true; }
};

struct NameListNode : public DummyNode {};

struct RoutineCallNode : public DummyNode {
 public:
  /// 函数名
  std::shared_ptr<IdentifierNode> identifier;
  /// 实参
  std::shared_ptr<ArgListNode> args;

  RoutineCallNode(const std::shared_ptr<AbstractNode> &identifier, const std::shared_ptr<AbstractNode> &args)
      : identifier(cast_node<IdentifierNode>(identifier)), args(cast_node<ArgListNode>(args)) {}

  explicit RoutineCallNode(const std::shared_ptr<AbstractNode> &identifier)
      : RoutineCallNode(identifier, make_node<ArgListNode>()) {}
  llvm::Value *codegen(CodegenContext &context) override;

 protected:
  std::string json_head() const override {
    return std::string{"\"type\": \"RoutineCall\", \"identifier\": "} + this->identifier->to_json() +
           ", \"args\": " + this->args->to_json();
  }

  bool should_have_children() const final { return false; }
};

/// 子过程列表
struct SubroutineListNode : public DummyNode {
 public:
  llvm::Value *codegen(CodegenContext &context) override;

 protected:
  std::string json_head() const override { return std::string{"\"type\": \"SubroutineList\""}; }

  bool should_have_children() const final { return true; }
};

struct HeadListNode : public DummyNode {
 public:
  using NodePtr = std::shared_ptr<AbstractNode>;
  std::shared_ptr<ConstListNode> const_list;
  std::shared_ptr<TypeListNode> type_list;
  std::shared_ptr<VarListNode> var_list;
  std::shared_ptr<SubroutineListNode> subroutine_list;

  HeadListNode(const NodePtr &consts, const NodePtr &types, const NodePtr &vars, const NodePtr &subroutines)
      : const_list(cast_node<ConstListNode>(consts)),
        type_list(cast_node<TypeListNode>(types)),
        var_list(cast_node<VarListNode>(vars)),
        subroutine_list(cast_node<SubroutineListNode>(subroutines)) {}

  llvm::Value *codegen(CodegenContext &context) override;

 protected:
  std::string json_head() const override {
    return std::string{"\"type\": \"HeadList\", \"consts\": "} + this->const_list->to_json() +
           ", \"types\": " + this->type_list->to_json() + ", \"vars\": " + this->var_list->to_json() +
           ", \"subroutines\": " + this->subroutine_list->to_json();
  }

  bool should_have_children() const final { return false; }
};

/// 过程语义节点
struct RoutineNode : public DummyNode {
 public:
  using NodePtr = std::shared_ptr<AbstractNode>;
  std::shared_ptr<IdentifierNode> name;
  std::shared_ptr<HeadListNode> head_list;

  RoutineNode(const NodePtr &name, const NodePtr &head_list)
      : name(cast_node<IdentifierNode>(name)), head_list(cast_node<HeadListNode>(head_list)) {}

 protected:
  RoutineNode() = default;

  bool should_have_children() const final { return true; }
};
/// 函数语义节点
struct ProgramNode : public RoutineNode {
 public:
  using RoutineNode::RoutineNode;

  llvm::Value *codegen(CodegenContext &context) override;

 protected:
  std::string json_head() const override {
    return std::string{"\"type\": \"Program\", \"name\": "} + this->name->to_json() +
           ", \"head\": " + this->head_list->to_json();
  }
};

struct SubroutineNode : public RoutineNode {
 public:
  std::shared_ptr<ParamListNode> params;
  std::shared_ptr<TypeNode> return_type;

  SubroutineNode(const NodePtr &name, const NodePtr &params, const NodePtr &type, const NodePtr &head_list)
      : RoutineNode(name, head_list), params(cast_node<ParamListNode>(params)), return_type(cast_node<TypeNode>(type)) {
    assert(is_a_ptr_of<SimpleTypeNode>(type) || is_a_ptr_of<AliasTypeNode>(type));
  }

  llvm::Value *codegen(CodegenContext &context) override;

 protected:
  std::string json_head() const override {
    return std::string{"\"type\": \"Subroutine\", \"name\": "} + this->name->to_json() +
           ", \"params\": " + this->params->to_json() + ", \"return\": " + this->return_type->to_json() +
           ", \"head\": " + this->head_list->to_json();
  }
};

struct CompoundStmtNode : public StmtNode {
 protected:
  std::string json_head() const override { return std::string{"\"type\": \"CompoundStmt\""}; }

  bool should_have_children() const override { return true; }
  llvm::Value *codegen(CodegenContext &context) override;
};

struct AssignStmtNode : public StmtNode {
  using NodePtr = std::shared_ptr<AbstractNode>;

 public:
  /// 被赋值量
  std::shared_ptr<ExprNode> lhs;
  /// 赋值量
  std::shared_ptr<ExprNode> rhs;

  AssignStmtNode(const NodePtr &lhs, const NodePtr &rhs)
      : lhs(cast_node<ExprNode>(lhs)), rhs(cast_node<ExprNode>(rhs)) {
    assert(is_a_ptr_of<IdentifierNode>(lhs) || is_a_ptr_of<ArrayRefNode>(lhs) /* || is_a_ptr_of<RecordRefNode>(lhs) */);
  }

  llvm::Value *codegen(CodegenContext &context) override;

 protected:
  std::string json_head() const override {
    return std::string{"\"type\": \"AssignStmt\", \"lhs\": "} + this->lhs->to_json() +
           ", \"rhs\": " + this->rhs->to_json();
  }

  bool should_have_children() const override { return false; }
};

struct ProcStmtNode : public StmtNode {
 public:
  std::shared_ptr<AbstractNode> proc_call;

  ProcStmtNode(const std::shared_ptr<AbstractNode> &proc_call) : proc_call(proc_call) {
    assert(is_a_ptr_of<RoutineCallNode>(proc_call) || is_a_ptr_of<SysCallNode>(proc_call));
  }

  llvm::Value *codegen(CodegenContext &context) override;

 protected:
  std::string json_head() const override {
    return std::string{"\"type\": \"ProcStmt\", \"call\": "} + this->proc_call->to_json();
  }

  bool should_have_children() const override { return false; }
};

struct StmtList : public StmtNode {};

struct RecordTypeNode : public TypeNode {
 public:
  using NodePtr = std::shared_ptr<AbstractNode>;
  std::map<std::string, int> index;
  std::vector<std::shared_ptr<TypeNode>> types;
  RecordTypeNode(const NodePtr &types) {
    int i = 0;
    for (auto &child : types->children()) {
      index[cast_node<TypeDefNode>(child)->name->name] = i++;
      this->types.push_back(cast_node<TypeDefNode>(child)->type);
    }
    this->type = Type::STRUCT;
  }

  virtual std::string json_head() const override;
  virtual bool should_have_children() const override { return false; }
};

}  // namespace spc

#endif
