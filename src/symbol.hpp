#ifndef SYMBOL_H
#define SYMBOL_H
#include <map>
#include "ast.hpp"

namespace spc {
struct SymbolTable;
struct CodegenContext;
/// 符号实体 用来存放变量与其对应的指针
struct Symbol {
  std::string name;  // 符号名称
  bool isConst;
  llvm::Value *ptr;
  std::shared_ptr<TypeNode> typeNode;
  llvm::Value *get_llvmptr() { return ptr; }
  Symbol(std::string name, std::shared_ptr<TypeNode> type, llvm::Value *ptr, bool isConst = false)
      : name(name), typeNode(type), ptr(ptr), isConst(isConst) {}
  friend struct SymbolTable;
};

struct SymbolTable {
  SymbolTable(CodegenContext *context) : context(*context) {}
  bool addLocalSymbol(std::string name, std::shared_ptr<TypeNode>, bool isConst = false);
  std::shared_ptr<Symbol> getLocalSymbol(std::string name);
  bool addGlobalSymbol(std::string name, std::shared_ptr<TypeNode>, llvm::Constant *initializer, bool isConst = false);
  std::shared_ptr<Symbol> getGlobalSymbol(std::string name);
  bool addLocalAlias(std::string alias, std::shared_ptr<TypeNode> type);
  std::shared_ptr<TypeNode> getLocalAlias(std::string name);
  bool addGlobalAlias(std::string alias, std::shared_ptr<TypeNode> type);
  std::shared_ptr<TypeNode> getGlobalAlias(std::string name);
  void resetLocals();

 protected:
  /// 局部变量表
  std::map<std::string, std::shared_ptr<Symbol>> localSymbols;
  /// 全局变量表
  std::map<std::string, std::shared_ptr<Symbol>> globalSymbols;
  /// 局部别名表
  std::map<std::string, std::shared_ptr<TypeNode>> localAliases;
  /// 全局别名表
  std::map<std::string, std::shared_ptr<TypeNode>> globalAliases;
  CodegenContext &context;
};
}  // namespace spc

#endif
