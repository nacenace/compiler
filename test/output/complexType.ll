; ModuleID = 'main'
source_filename = "main"

@arr = internal global [5 x i32] zeroinitializer
@p = internal global { i32, i32 } zeroinitializer
@0 = private unnamed_addr constant [23 x i8] c"\E6\95\B0\E7\BB\84\E7\AC\AC\E4\BA\8C\E4\B8\AA\E7\9A\84\E5\80\BC:\00", align 1
@1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@3 = private unnamed_addr constant [17 x i8] c"\E7\BB\93\E6\9E\84\E4\BD\93\E7\9A\84\E5\80\BC:\00", align 1
@4 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@5 = private unnamed_addr constant [3 x i8] c", \00", align 1
@6 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@7 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

define i32 @main() {
entry:
  store i32 1, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @arr, i32 0, i32 1)
  store i32 2, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @arr, i32 0, i32 2)
  store i32 3, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @arr, i32 0, i32 3)
  store i32 4, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @arr, i32 0, i32 4)
  store i32 5, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @arr, i64 1, i32 0)
  store i32 10, i32* getelementptr inbounds ({ i32, i32 }, { i32, i32 }* @p, i32 0, i32 0)
  store i32 20, i32* getelementptr inbounds ({ i32, i32 }, { i32, i32 }* @p, i32 0, i32 1)
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @0, i32 0, i32 0))
  %1 = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @arr, i32 0, i32 2)
  %2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @1, i32 0, i32 0), i32 %1)
  %3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @2, i32 0, i32 0))
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @3, i32 0, i32 0))
  %5 = load i32, i32* getelementptr inbounds ({ i32, i32 }, { i32, i32 }* @p, i32 0, i32 0)
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @4, i32 0, i32 0), i32 %5)
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @5, i32 0, i32 0))
  %8 = load i32, i32* getelementptr inbounds ({ i32, i32 }, { i32, i32 }* @p, i32 0, i32 1)
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @6, i32 0, i32 0), i32 %8)
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @7, i32 0, i32 0))
  ret i32 0
}

declare i32 @printf(i8*, ...)
