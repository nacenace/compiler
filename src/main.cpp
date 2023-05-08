#include <llvm/IR/LegacyPassManager.h>
#include <llvm/Support/FileSystem.h>
#include <llvm/Support/Host.h>
#include <llvm/Support/TargetRegistry.h>
#include <llvm/Support/TargetSelect.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/Target/TargetMachine.h>
#include <unistd.h>
#include <cstdlib>
#include <cstring>
#include <fstream>
#include <iostream>
#include <memory>
#include <system_error>
#include "ast.hpp"
#include "context.hpp"
#include "y.tab.h"

using namespace std;
using namespace spc;
using namespace llvm;

extern YYSTYPE program;

void emit_target(raw_fd_ostream &dest, TargetMachine::CodeGenFileType type, Module &module) {
  // 初始化环境信息
  InitializeAllTargetInfos();
  InitializeAllTargets();
  InitializeAllTargetMCs();
  InitializeAllAsmParsers();
  InitializeAllAsmPrinters();

  // 设置默认输出 Target
  auto target_triple = sys::getDefaultTargetTriple();
  module.setTargetTriple(target_triple);

  // 错误检查
  string error;
  auto target = TargetRegistry::lookupTarget(target_triple, error);
  if (!target) {
    errs() << error;
    exit(1);
  }

  // 设置平台细节
  auto cpu = "generic";
  auto features = "";
  TargetOptions opt;
  auto rm = Optional<Reloc::Model>(Reloc::PIC_);
  auto target_machine = target->createTargetMachine(target_triple, cpu, features, opt, rm);
  module.setDataLayout(target_machine->createDataLayout());

  legacy::PassManager pass;
  if (target_machine->addPassesToEmitFile(pass, dest, nullptr, type)) {
    errs() << "The target machine cannot emit an object file";
    exit(1);
  }

  pass.run(module);
  dest.flush();
}

int main(int argc, char *argv[]) {
  enum class Target { UNDEFINED, LLVM, ASM, OBJ };
  Target target = Target::UNDEFINED;
  bool optimization = false;
  bool ast = false;

  char *sourceFile = nullptr;  // Pascal 源代码文件
  char *outFile = nullptr;

  for (int i = 1; i < argc; ++i) {
    if (strcmp(argv[i], "-l") == 0)
      target = Target::LLVM;
    else if (strcmp(argv[i], "-S") == 0)
      target = Target::ASM;
    else if (strcmp(argv[i], "-c") == 0)
      target = Target::OBJ;
    else if (strcmp(argv[i], "-O") == 0)
      optimization = true;
    else if (strcmp(argv[i], "-ast") == 0) {
      ast = true;                             // 输出 ast 树
    } else if (strcmp(argv[i], "-o") == 0) {  // 输出文件名
      //./spc -S -o outputname srcname
      i++;
      if (i >= argc) {
        cout << "para error" << endl;
      } else {
        outFile = argv[i];
      }
    } else if (argv[i][0] == '-') {
      printf("Error: unknown argument: %s", argv[i]);
      exit(1);
    } else
      sourceFile = argv[i];
  }

  if (target == Target::UNDEFINED || sourceFile == nullptr) {
    puts("USAGE: exp <option> <source.pas>");
    puts("OPTION:");
    puts("  -l            Emit LLVM IR code (.ll)");
    puts("  -S            Emit assembly code (.s)");
    puts("  -c            Emit object code (.o)");
    puts("  -ast          puts ast");
    puts("  -o des        name output file as des");
    exit(1);
  }
  /*
  sourceFile = argv[1];

  */
  if (freopen(sourceFile, "r", stdin) == nullptr) {  // 将 stdin 重定向为 Pascal 源代码 以供 flex 进行词法分析
    cout << "failed to open sourceFile " + string(sourceFile) << endl;
    exit(-1);
  }

  // 输出 sourceFile 的内容
  // cout << "sourceFile: " << sourceFile << endl;

  yyparse();  // 开始词法分析

  if (ast) {
    int i = -1;

    for (i = strlen(sourceFile) - 1; i >= 0; i--) {
      if (sourceFile[i] == '/') {
        break;
      }
    }
    string astFile(&sourceFile[i + 1]);
    astFile.erase(astFile.rfind('.'));
    astFile += "_ast.json";
    std::ofstream ast(astFile, ios::out);

    if (!ast.is_open()) {
      cout << "failed to open " << astFile << endl;
      exit(0);
    }
    ast << program->to_json();
    ast.close();
  }

  CodegenContext context("main", optimization);  // 设置代码生成的上下文
  try {
    program->codegen(context);
  } catch (CodegenException &e) {
    cerr << e.what() << endl;
    exit(-1);
  }

  string output;

  if (outFile == nullptr) {
    int i = -1;
    for (i = strlen(sourceFile) - 1; i >= 0; i--) {
      if (sourceFile[i] == '/') {
        break;
      }
    }
    output = string(&sourceFile[i + 1]);
    output.erase(output.rfind('.'));
  } else {
    output = string(outFile);
  }

  switch (target) {
    case Target::LLVM:
      output.append(".ll");
      break;
    case Target::ASM:
      output.append(".s");
      break;
    case Target::OBJ:
      output.append(".o");
      break;
    default:
      break;
  }

  error_code ec;
  raw_fd_ostream fd(output, ec, sys::fs::F_None);
  if (ec) {
    errs() << "Could not open file: " << ec.message();
    exit(1);
  }

  switch (target) {
    case Target::LLVM:
      context.module->print(fd, nullptr);
      break;
    case Target::ASM:
      emit_target(fd, TargetMachine::CGFT_AssemblyFile, *context.module);
      break;
    case Target::OBJ:
      emit_target(fd, TargetMachine::CGFT_ObjectFile, *context.module);
      break;
    default:
      break;
  }

  return 0;
}
