; ModuleID = 'main'
source_filename = "main"

@a = internal global i32 -2
@b = internal global double -5.000000e+00
@c = internal global { [10 x i32] } zeroinitializer
@0 = private unnamed_addr constant [17 x i8] c"-2\E7\9A\84\E7\BB\9D\E5\AF\B9\E5\80\BC: \00", align 1
@1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@3 = private unnamed_addr constant [19 x i8] c"-5.0\E7\9A\84\E7\BB\9D\E5\AF\B9\E5\80\BC: \00", align 1
@4 = private unnamed_addr constant [4 x i8] c"%lf\00", align 1
@5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@6 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@7 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

define i32 @main() {
entry:
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @0, i32 0, i32 0))
  %1 = load i32, i32* @a
  %2 = call i32 @abs(i32 %1)
  %3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @1, i32 0, i32 0), i32 %2)
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @2, i32 0, i32 0))
  %5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @3, i32 0, i32 0))
  %6 = load double, double* @b
  %7 = call double @fabs(double %6)
  %8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @4, i32 0, i32 0), double %7)
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @5, i32 0, i32 0))
  store i32 -15, i32* getelementptr inbounds ({ [10 x i32] }, { [10 x i32] }* @c, i32 0, i32 0, i32 0)
  %10 = load i32, i32* getelementptr inbounds ({ [10 x i32] }, { [10 x i32] }* @c, i32 0, i32 0, i32 0)
  %11 = call i32 @abs(i32 %10)
  %12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @6, i32 0, i32 0), i32 %11)
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @7, i32 0, i32 0))
  ret i32 0
}

declare i32 @printf(i8*, ...)

declare i32 @abs(i32)

declare double @fabs(double)
