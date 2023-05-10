; ModuleID = 'main'
source_filename = "main"

@zero = internal constant i32 0
@one = internal constant i32 1
@two = internal constant i32 2
@x = internal global i32 0
@y = internal global i32 0
@i = internal global i32 0
@0 = private unnamed_addr constant [34 x i8] c"Please input two integers x and y\00", align 1
@1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@3 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@4 = private unnamed_addr constant [7 x i8] c"%*[^\0A]\00", align 1
@5 = private unnamed_addr constant [8 x i8] c"if test\00", align 1
@6 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@7 = private unnamed_addr constant [6 x i8] c"x < y\00", align 1
@8 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@9 = private unnamed_addr constant [6 x i8] c"x > y\00", align 1
@10 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@11 = private unnamed_addr constant [6 x i8] c"x = y\00", align 1
@12 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@13 = private unnamed_addr constant [10 x i8] c"case test\00", align 1
@14 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@15 = private unnamed_addr constant [11 x i8] c"x mod 3 = \00", align 1
@16 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@17 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@18 = private unnamed_addr constant [12 x i8] c"repeat test\00", align 1
@19 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@20 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@21 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@22 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@23 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@24 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@25 = private unnamed_addr constant [11 x i8] c"while test\00", align 1
@26 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@27 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@28 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@29 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@30 = private unnamed_addr constant [9 x i8] c"for test\00", align 1
@31 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@32 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@33 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

define i32 @main() {
entry:
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @0, i32 0, i32 0))
  %1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @1, i32 0, i32 0))
  %2 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @2, i32 0, i32 0), i32* @x)
  %3 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @3, i32 0, i32 0), i32* @y)
  %4 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @4, i32 0, i32 0))
  %5 = call i32 @getchar()
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @5, i32 0, i32 0))
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @6, i32 0, i32 0))
  %8 = load i32, i32* @x
  %9 = load i32, i32* @y
  %10 = icmp slt i32 %8, %9
  %ifcond = icmp eq i1 %10, true
  br i1 %ifcond, label %then, label %else

then:                                             ; preds = %entry
  %11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @7, i32 0, i32 0))
  %12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @8, i32 0, i32 0))
  br label %merge4

else:                                             ; preds = %entry
  %13 = load i32, i32* @x
  %14 = load i32, i32* @y
  %15 = icmp sgt i32 %13, %14
  %ifcond1 = icmp eq i1 %15, true
  br i1 %ifcond1, label %then2, label %else3

then2:                                            ; preds = %else
  %16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @9, i32 0, i32 0))
  %17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @10, i32 0, i32 0))
  br label %merge

else3:                                            ; preds = %else
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @11, i32 0, i32 0))
  %19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @12, i32 0, i32 0))
  br label %merge

merge:                                            ; preds = %else3, %then2
  br label %merge4

merge4:                                           ; preds = %merge, %then
  %20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @13, i32 0, i32 0))
  %21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @14, i32 0, i32 0))
  %22 = load i32, i32* @x
  %23 = srem i32 %22, 3
  switch i32 %23, label %merge5 [
    i32 0, label %branch
    i32 1, label %branch6
    i32 2, label %branch7
  ]

merge5:                                           ; preds = %merge4, %branch7, %branch6, %branch
  %24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @15, i32 0, i32 0))
  %25 = load i32, i32* @x
  %26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @16, i32 0, i32 0), i32 %25)
  %27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @17, i32 0, i32 0))
  %28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @18, i32 0, i32 0))
  %29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @19, i32 0, i32 0))
  store i32 0, i32* @i
  %30 = load i32, i32* @i
  %31 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @20, i32 0, i32 0), i32 %30)
  %32 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @21, i32 0, i32 0), i8 32)
  %33 = load i32, i32* @i
  %34 = add i32 %33, 1
  store i32 %34, i32* @i
  %35 = load i32, i32* @i
  %36 = icmp eq i32 %35, 10
  br i1 %36, label %end, label %loop

branch:                                           ; preds = %merge4
  %37 = load i32, i32* @zero
  store i32 %37, i32* @x
  br label %merge5

branch6:                                          ; preds = %merge4
  %38 = load i32, i32* @one
  store i32 %38, i32* @x
  br label %merge5

branch7:                                          ; preds = %merge4
  %39 = load i32, i32* @two
  store i32 %39, i32* @x
  br label %merge5

loop:                                             ; preds = %loop, %merge5
  %40 = load i32, i32* @i
  %41 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @22, i32 0, i32 0), i32 %40)
  %42 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @23, i32 0, i32 0), i8 32)
  %43 = load i32, i32* @i
  %44 = add i32 %43, 1
  store i32 %44, i32* @i
  %45 = load i32, i32* @i
  %46 = icmp eq i32 %45, 10
  br i1 %46, label %end, label %loop

end:                                              ; preds = %loop, %merge5
  %47 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @24, i32 0, i32 0))
  %48 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @25, i32 0, i32 0))
  %49 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @26, i32 0, i32 0))
  %50 = load i32, i32* @i
  %51 = icmp sgt i32 %50, 0
  br i1 %51, label %loop8, label %end9

loop8:                                            ; preds = %loop8, %end
  %52 = load i32, i32* @i
  %53 = sub i32 %52, 1
  store i32 %53, i32* @i
  %54 = load i32, i32* @i
  %55 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @27, i32 0, i32 0), i32 %54)
  %56 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @28, i32 0, i32 0), i8 32)
  %57 = load i32, i32* @i
  %58 = icmp sgt i32 %57, 0
  br i1 %58, label %loop8, label %end9

end9:                                             ; preds = %loop8, %end
  %59 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @29, i32 0, i32 0))
  %60 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @30, i32 0, i32 0))
  %61 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @31, i32 0, i32 0))
  store i32 1, i32* @i
  %62 = load i32, i32* @i
  %63 = icmp sgt i32 %62, 10
  br i1 %63, label %end11, label %loop10

loop10:                                           ; preds = %loop10, %end9
  %64 = load i32, i32* @i
  %65 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @32, i32 0, i32 0), i32 %64)
  %66 = load i32, i32* @i
  %67 = add i32 %66, 1
  store i32 %67, i32* @i
  %68 = load i32, i32* @i
  %69 = icmp sgt i32 %68, 10
  br i1 %69, label %end11, label %loop10

end11:                                            ; preds = %loop10, %end9
  %70 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @33, i32 0, i32 0))
  ret i32 0
}

declare i32 @printf(i8*, ...)

declare i32 @scanf(i8*, ...)

declare i32 @getchar()
