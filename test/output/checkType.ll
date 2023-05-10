; ModuleID = 'main'
source_filename = "main"

@i = internal global i32 0
@r = internal global double 0.000000e+00
@0 = private unnamed_addr constant [18 x i8] c"i is an integer: \00", align 1
@1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@3 = private unnamed_addr constant [40 x i8] c"\E6\8A\8Ai\E8\B5\8B\E7\BB\99\E5\AE\9E\E6\95\B0\E5\9E\8B\E5\8F\98\E9\87\8Fr\E5\89\8D,r\E7\9A\84\E5\80\BC: \00", align 1
@4 = private unnamed_addr constant [4 x i8] c"%lf\00", align 1
@5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@6 = private unnamed_addr constant [40 x i8] c"\E6\8A\8Ai\E8\B5\8B\E7\BB\99\E5\AE\9E\E6\95\B0\E5\9E\8B\E5\8F\98\E9\87\8Fr\E5\90\8E,r\E7\9A\84\E5\80\BC: \00", align 1
@7 = private unnamed_addr constant [4 x i8] c"%lf\00", align 1
@8 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

define i32 @main() {
entry:
  store i32 10, i32* @i
  store double 3.140000e+00, double* @r
  %0 = load i32, i32* @i
  %1 = icmp eq i32 %0, 10
  %ifcond = icmp eq i1 %1, true
  br i1 %ifcond, label %then, label %merge

then:                                             ; preds = %entry
  %2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @0, i32 0, i32 0))
  %3 = load i32, i32* @i
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @1, i32 0, i32 0), i32 %3)
  %5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @2, i32 0, i32 0))
  br label %merge

merge:                                            ; preds = %then, %entry
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @3, i32 0, i32 0))
  %7 = load double, double* @r
  %8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @4, i32 0, i32 0), double %7)
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @5, i32 0, i32 0))
  %10 = load i32, i32* @i
  %11 = sitofp i32 %10 to double
  store double %11, double* @r
  %12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @6, i32 0, i32 0))
  %13 = load double, double* @r
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @7, i32 0, i32 0), double %13)
  %15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @8, i32 0, i32 0))
  ret i32 0
}

declare i32 @printf(i8*, ...)
