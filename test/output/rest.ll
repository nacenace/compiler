; ModuleID = 'main'
source_filename = "main"

@0 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@2 = private unnamed_addr constant [4 x i8] c"%lf\00", align 1
@3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@4 = private unnamed_addr constant [4 x i8] c"%lf\00", align 1
@5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@6 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@7 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@8 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@9 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@10 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@11 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

define i32 @sum(i32, i32) {
entry:
  %a = alloca i32
  store i32 %0, i32* %a
  %b = alloca i32
  store i32 %1, i32* %b
  %sum = alloca i32
  %2 = load i32, i32* %a
  %3 = load i32, i32* %b
  %4 = add i32 %2, %3
  store i32 %4, i32* %sum
  %5 = load i32, i32* %sum
  ret i32 %5
}

define i32 @main() {
entry:
  %0 = call i32 @sum(i32 5, i32 10)
  %1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @0, i32 0, i32 0), i32 %0)
  %2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @1, i32 0, i32 0))
  %3 = call double @fabs(double 0x41EFFFFFFF600000)
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @2, i32 0, i32 0), double %3)
  %5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @3, i32 0, i32 0))
  %6 = call double @sqrt(double 2.500000e+01)
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @4, i32 0, i32 0), double %6)
  %8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @5, i32 0, i32 0))
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @6, i32 0, i32 0), i8 67)
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @7, i32 0, i32 0))
  %11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @8, i32 0, i32 0), i32 14)
  %12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @9, i32 0, i32 0))
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @10, i32 0, i32 0), i32 16)
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @11, i32 0, i32 0))
  ret i32 0
}

declare i32 @printf(i8*, ...)

declare double @fabs(double)

declare double @sqrt(double)
