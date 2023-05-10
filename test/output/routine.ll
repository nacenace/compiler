; ModuleID = 'main'
source_filename = "main"

@x = internal global i32 0
@0 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@2 = private unnamed_addr constant [27 x i8] c"Please input one integer x\00", align 1
@3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@4 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@5 = private unnamed_addr constant [7 x i8] c"%*[^\0A]\00", align 1
@6 = private unnamed_addr constant [30 x i8] c"\E9\80\92\E5\BD\92\E8\B0\83\E7\94\A8\E5\87\BD\E6\95\B0f(X)\E7\BB\93\E6\9E\9C:\00", align 1
@7 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

define i32 @f(i32) {
entry:
  %x = alloca i32
  store i32 %0, i32* %x
  %f = alloca i32
  %1 = load i32, i32* %x
  %2 = icmp eq i32 %1, 0
  %ifcond = icmp eq i1 %2, true
  br i1 %ifcond, label %then, label %else

then:                                             ; preds = %entry
  store i32 0, i32* %f
  br label %merge

else:                                             ; preds = %entry
  %3 = load i32, i32* %x
  %4 = sub i32 %3, 1
  %5 = call i32 @f(i32 %4)
  %6 = load i32, i32* %x
  %7 = add i32 %5, %6
  store i32 %7, i32* %f
  br label %merge

merge:                                            ; preds = %else, %then
  %8 = load i32, i32* %f
  ret i32 %8
}

define void @g(i32) {
entry:
  %x = alloca i32
  store i32 %0, i32* %x
  %i = alloca i32
  %1 = load i32, i32* %x
  store i32 1, i32* %i
  %2 = load i32, i32* %i
  %3 = icmp sgt i32 %2, %1
  br i1 %3, label %end, label %loop

loop:                                             ; preds = %loop, %entry
  %4 = load i32, i32* %i
  %5 = call i32 @f(i32 %4)
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @0, i32 0, i32 0), i32 %5)
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @1, i32 0, i32 0))
  %8 = load i32, i32* %i
  %9 = add i32 %8, 1
  store i32 %9, i32* %i
  %10 = load i32, i32* %i
  %11 = icmp sgt i32 %10, %1
  br i1 %11, label %end, label %loop

end:                                              ; preds = %loop, %entry
  ret void
}

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @2, i32 0, i32 0))
  %1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @3, i32 0, i32 0))
  %2 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @4, i32 0, i32 0), i32* @x)
  %3 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @5, i32 0, i32 0))
  %4 = call i32 @getchar()
  %5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @6, i32 0, i32 0))
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @7, i32 0, i32 0))
  %7 = load i32, i32* @x
  call void @g(i32 %7)
  ret i32 0
}

declare i32 @scanf(i8*, ...)

declare i32 @getchar()
