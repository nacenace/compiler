; ModuleID = 'main'
source_filename = "main"

@b = internal global i1 false
@c = internal global i8 0
@i = internal global i32 0
@r = internal global double 0.000000e+00
@0 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@2 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@4 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@6 = private unnamed_addr constant [4 x i8] c"%lf\00", align 1
@7 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@8 = private unnamed_addr constant [14 x i8] c"Hello, world!\00", align 1
@9 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

define i32 @main() {
entry:
  store i1 true, i1* @b
  store i8 65, i8* @c
  store i32 10, i32* @i
  store double 3.140000e+00, double* @r
  %0 = load i1, i1* @b
  %1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @0, i32 0, i32 0), i1 %0)
  %2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @1, i32 0, i32 0))
  %3 = load i8, i8* @c
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @2, i32 0, i32 0), i8 %3)
  %5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @3, i32 0, i32 0))
  %6 = load i32, i32* @i
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @4, i32 0, i32 0), i32 %6)
  %8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @5, i32 0, i32 0))
  %9 = load double, double* @r
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @6, i32 0, i32 0), double %9)
  %11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @7, i32 0, i32 0))
  %12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @8, i32 0, i32 0))
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @9, i32 0, i32 0))
  ret i32 0
}

declare i32 @printf(i8*, ...)
