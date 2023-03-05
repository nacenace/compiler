#include <iostream>
#include <fstream>
#include <cstring>
#include <cstdlib>
#include <memory>
#include "ast.hpp"
#include "y.tab.h"

using namespace std;
using namespace exp;

extern YYSTYPE program;

int main(int argc, char *argv[]) {
    char *sourceFile = nullptr; // Pascal 源代码文件

    sourceFile = argv[1];

    if (freopen(sourceFile, "r", stdin)==nullptr) {//将 stdin 重定向为 Pascal 源代码 以供 flex 进行词法分析
        cout<<"failed to open sourceFile "+ string(sourceFile)<<endl;
        exit(-1);
    } 

    // 输出 sourceFile 的内容
    cout << "sourceFile: " << sourceFile << endl;

    yyparse();  //开始词法分析

    int i=-1;
     
    for (i=strlen(sourceFile)-1;i>=0;i--) {
        if(sourceFile[i]=='/'){
            break;
        }
    }
    string astFile(&sourceFile[i+1]);
    astFile.erase(astFile.rfind('.'));
    astFile+="_ast.json";
    std::ofstream ast(astFile,ios::out);
       
    if(!ast.is_open()){
        cout<<"failed to open "<<astFile<<endl;
        exit(0);
    }
    ast << program->to_json();
    ast.close(); 

    return 0;
}
