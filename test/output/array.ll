; ModuleID = 'main'
source_filename = "main"

@n = internal global [10 x i32] zeroinitializer
@nums = internal global [10 x i32] zeroinitializer
@i = internal global i32 0
@j = internal global i32 0
@0 = private unnamed_addr constant [9 x i8] c"Element[\00", align 1
@1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@2 = private unnamed_addr constant [5 x i8] c"] = \00", align 1
@3 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

define i32 @main() {
entry:
  store i32 1, i32* @i
  %0 = load i32, i32* @i
  %1 = icmp sgt i32 %0, 10
  br i1 %1, label %end, label %loop

loop:                                             ; preds = %loop, %entry
  %2 = load i32, i32* @i
  %3 = sub i32 %2, 1
  %4 = getelementptr [10 x i32], [10 x i32]* @n, i32 0, i32 %3
  %5 = load i32, i32* @i
  %6 = add i32 %5, 100
  store i32 %6, i32* %4
  %7 = load i32, i32* @i
  %8 = add i32 %7, 1
  store i32 %8, i32* @i
  %9 = load i32, i32* @i
  %10 = icmp sgt i32 %9, 10
  br i1 %10, label %end, label %loop

end:                                              ; preds = %loop, %entry
  store i32 1, i32* @j
  %11 = load i32, i32* @j
  %12 = icmp sgt i32 %11, 10
  br i1 %12, label %end2, label %loop1

loop1:                                            ; preds = %loop1, %end
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @0, i32 0, i32 0))
  %14 = load i32, i32* @j
  %15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @1, i32 0, i32 0), i32 %14)
  %16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @2, i32 0, i32 0))
  %17 = load i32, i32* @j
  %18 = sub i32 %17, 1
  %19 = getelementptr [10 x i32], [10 x i32]* @n, i32 0, i32 %18
  %20 = load i32, i32* %19
  %21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @3, i32 0, i32 0), i32 %20)
  %22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @4, i32 0, i32 0))
  %23 = load i32, i32* @j
  %24 = add i32 %23, 1
  store i32 %24, i32* @j
  %25 = load i32, i32* @j
  %26 = icmp sgt i32 %25, 10
  br i1 %26, label %end2, label %loop1

end2:                                             ; preds = %loop1, %end
  ret i32 0
}

declare i32 @printf(i8*, ...)
