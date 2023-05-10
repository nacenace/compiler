; ModuleID = 'main'
source_filename = "main"

@book1 = internal global { i8, i32 } zeroinitializer
@book2 = internal global { i8, i32 } zeroinitializer
@0 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

define i32 @main() {
entry:
  store i8 97, i8* getelementptr inbounds ({ i8, i32 }, { i8, i32 }* @book1, i32 0, i32 0)
  %0 = load i8, i8* getelementptr inbounds ({ i8, i32 }, { i8, i32 }* @book1, i32 0, i32 0)
  %1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @0, i32 0, i32 0), i8 %0)
  %2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @1, i32 0, i32 0))
  store i32 100, i32* getelementptr inbounds ({ i8, i32 }, { i8, i32 }* @book2, i32 0, i32 1)
  %3 = load i32, i32* getelementptr inbounds ({ i8, i32 }, { i8, i32 }* @book2, i32 0, i32 1)
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @2, i32 0, i32 0), i32 %3)
  %5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @3, i32 0, i32 0))
  ret i32 0
}

declare i32 @printf(i8*, ...)
