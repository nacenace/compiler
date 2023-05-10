; ModuleID = 'main'
source_filename = "main"

@x = internal global i32 0
@y = internal global i32 0
@0 = private unnamed_addr constant [88 x i8] c"Please input two integers x and y, and I will return you their greatest common divisor.\00", align 1
@1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@3 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@4 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

define i32 @gcd(i32, i32) {
entry:
  %a = alloca i32
  store i32 %0, i32* %a
  %b = alloca i32
  store i32 %1, i32* %b
  %gcd = alloca i32
  %2 = load i32, i32* %b
  %3 = icmp eq i32 %2, 0
  %ifcond = icmp eq i1 %3, true
  br i1 %ifcond, label %then, label %else

then:                                             ; preds = %entry
  %4 = load i32, i32* %a
  store i32 %4, i32* %gcd
  br label %merge

else:                                             ; preds = %entry
  %5 = load i32, i32* %b
  %6 = load i32, i32* %a
  %7 = load i32, i32* %b
  %8 = srem i32 %6, %7
  %9 = call i32 @gcd(i32 %5, i32 %8)
  store i32 %9, i32* %gcd
  br label %merge

merge:                                            ; preds = %else, %then
  %10 = load i32, i32* %gcd
  ret i32 %10
}

define i32 @main() {
entry:
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([88 x i8], [88 x i8]* @0, i32 0, i32 0))
  %1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @1, i32 0, i32 0))
  %2 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @2, i32 0, i32 0), i32* @x)
  %3 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @3, i32 0, i32 0), i32* @y)
  %4 = load i32, i32* @x
  %5 = load i32, i32* @y
  %6 = call i32 @gcd(i32 %4, i32 %5)
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @4, i32 0, i32 0), i32 %6)
  %8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @5, i32 0, i32 0))
  ret i32 0
}

declare i32 @printf(i8*, ...)

declare i32 @scanf(i8*, ...)
