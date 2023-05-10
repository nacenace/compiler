; ModuleID = 'main'
source_filename = "main"

@x = internal global i32 0
@y = internal global i32 0
@0 = private unnamed_addr constant [17 x i8] c"hello the world \00", align 1
@1 = private unnamed_addr constant [34 x i8] c"Please input two integers x and y\00", align 1
@2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@3 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@4 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@5 = private unnamed_addr constant [7 x i8] c"%*[^\0A]\00", align 1
@6 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@7 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@8 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

define i32 @main() {
entry:
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @0, i32 0, i32 0))
  %1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @1, i32 0, i32 0))
  %2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @2, i32 0, i32 0))
  %3 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @3, i32 0, i32 0), i32* @x)
  %4 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @4, i32 0, i32 0), i32* @y)
  %5 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @5, i32 0, i32 0))
  %6 = call i32 @getchar()
  %7 = load i32, i32* @y
  %8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @6, i32 0, i32 0), i32 %7)
  %9 = load i32, i32* @x
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @7, i32 0, i32 0), i32 %9)
  %11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @8, i32 0, i32 0))
  ret i32 0
}

declare i32 @printf(i8*, ...)

declare i32 @scanf(i8*, ...)

declare i32 @getchar()
