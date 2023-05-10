#include "ast.hpp"
#include <fmt/core.h>
#include <iostream>
#include <sstream>

using namespace spc;
using namespace std;

using NodePtr = std::shared_ptr<AbstractNode>;

void AbstractNode::print_json() const { clog << this->to_json() << endl; }

string AbstractNode::to_json() const {
  std::stringstream ret;
  ret << "{";
  ret << this->json_head();
  if (this->should_have_children()) {
    ret << ", \"children\": [";
    bool is_first = true;
    for (auto &node : this->_children) {
      if (is_first)
        is_first = false;
      else
        ret << ", ";
      ret << node->to_json();
    }
    ret << "]";
  }
  ret << "}";
  return ret.str();
}

string SysCallNode::json_head() const {
  return std::string{"\"type\": \"SysCall\", \"identifier\": \""} + to_string(this->routine->routine) +
         "\", \"args\": " + this->args->to_json();
}

SysCallNode::SysCallNode(const NodePtr &routine, const NodePtr &args)
    : routine(cast_node<SysRoutineNode>(routine)), args(cast_node<ArgListNode>(args)) {}

std::string spc::type2string(Type type) {
  const std::map<Type, std::string> type_to_string{{Type::UNDEFINED, "<undefined-type>"},
                                                   {Type::STRING, "string"},
                                                   {Type::INTEGER, "integer"},
                                                   {Type::REAL, "real"},
                                                   {Type::BOOLEN, "boolen"},
                                                   {Type::CHAR, "char"},
                                                   {Type::ARRAY, "array"},
                                                   {Type::STRUCT, "struct"},
                                                   {Type::VOID, "void"}};
  return type_to_string.at(type);
}

std::string SimpleTypeNode::json_head() const {
  return fmt::format("\"type\": \"Type\", \"name\":\"{}\"", type2string(this->type));
}

std::string StringTypeNode::json_head() const {
  return fmt::format("\"type\": \"Type\", \"name\":\"{}\"", type2string(this->type));
}

std::string ArrayTypeNode::json_head() const {
  return fmt::format("\"type\": \"Type\", \"name\":\"{}\"", type2string(this->type));
}

std::string RecordTypeNode::json_head() const {
  return fmt::format("\"type\": \"Type\", \"name\":\"{}\"", type2string(this->type));
}

std::string AliasTypeNode::json_head() const {
  return fmt::format("\"type\": \"Type\", \"name\": \"alias\", \"identifier\":{{{0}}}", this->identifier->to_json());
}
