; ModuleID = 'main'
source_filename = "main"

@nums = internal global [10 x i32] zeroinitializer
@i = internal global i32 0
@x = internal global i32 0
@0 = private unnamed_addr constant [57 x i8] c"Please enter 10 integers, press Enter after each number:\00", align 1
@1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@3 = private unnamed_addr constant [7 x i8] c"%*[^\0A]\00", align 1
@4 = private unnamed_addr constant [29 x i8] c"The numbers you entered are:\00", align 1
@5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@6 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@7 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@8 = private unnamed_addr constant [14 x i8] c"Start to sort\00", align 1
@9 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@10 = private unnamed_addr constant [24 x i8] c"The sorted numbers are:\00", align 1
@11 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@12 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@13 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

define i32 @partion(i32, i32) {
entry:
  %low = alloca i32
  store i32 %0, i32* %low
  %high = alloca i32
  store i32 %1, i32* %high
  %partion = alloca i32
  %pivot = alloca i32
  %i = alloca i32
  %j = alloca i32
  %temp = alloca i32
  %2 = load i32, i32* %high
  %3 = sub i32 %2, 1
  %4 = getelementptr [10 x i32], [10 x i32]* @nums, i32 0, i32 %3
  %5 = load i32, i32* %4
  store i32 %5, i32* %pivot
  %6 = load i32, i32* %low
  %7 = sub i32 %6, 1
  store i32 %7, i32* %i
  %8 = load i32, i32* %low
  store i32 %8, i32* %j
  %9 = load i32, i32* %j
  %10 = sub i32 %9, 1
  %11 = getelementptr [10 x i32], [10 x i32]* @nums, i32 0, i32 %10
  %12 = load i32, i32* %11
  %13 = load i32, i32* %pivot
  %14 = icmp slt i32 %12, %13
  %ifcond = icmp eq i1 %14, true
  br i1 %ifcond, label %then, label %merge

then:                                             ; preds = %entry
  %15 = load i32, i32* %i
  %16 = add i32 %15, 1
  store i32 %16, i32* %i
  %17 = load i32, i32* %i
  %18 = sub i32 %17, 1
  %19 = getelementptr [10 x i32], [10 x i32]* @nums, i32 0, i32 %18
  %20 = load i32, i32* %19
  store i32 %20, i32* %temp
  %21 = load i32, i32* %i
  %22 = sub i32 %21, 1
  %23 = getelementptr [10 x i32], [10 x i32]* @nums, i32 0, i32 %22
  %24 = load i32, i32* %j
  %25 = sub i32 %24, 1
  %26 = getelementptr [10 x i32], [10 x i32]* @nums, i32 0, i32 %25
  %27 = load i32, i32* %26
  store i32 %27, i32* %23
  %28 = load i32, i32* %j
  %29 = sub i32 %28, 1
  %30 = getelementptr [10 x i32], [10 x i32]* @nums, i32 0, i32 %29
  %31 = load i32, i32* %temp
  store i32 %31, i32* %30
  br label %merge

merge:                                            ; preds = %then, %entry
  %32 = load i32, i32* %j
  %33 = add i32 %32, 1
  store i32 %33, i32* %j
  %34 = load i32, i32* %j
  %35 = load i32, i32* %high
  %36 = icmp sge i32 %34, %35
  br i1 %36, label %end, label %loop

loop:                                             ; preds = %merge3, %merge
  %37 = load i32, i32* %j
  %38 = sub i32 %37, 1
  %39 = getelementptr [10 x i32], [10 x i32]* @nums, i32 0, i32 %38
  %40 = load i32, i32* %39
  %41 = load i32, i32* %pivot
  %42 = icmp slt i32 %40, %41
  %ifcond1 = icmp eq i1 %42, true
  br i1 %ifcond1, label %then2, label %merge3

end:                                              ; preds = %merge3, %merge
  %43 = load i32, i32* %i
  %44 = add i32 %43, 1
  %45 = sub i32 %44, 1
  %46 = getelementptr [10 x i32], [10 x i32]* @nums, i32 0, i32 %45
  %47 = load i32, i32* %46
  store i32 %47, i32* %temp
  %48 = load i32, i32* %i
  %49 = add i32 %48, 1
  %50 = sub i32 %49, 1
  %51 = getelementptr [10 x i32], [10 x i32]* @nums, i32 0, i32 %50
  %52 = load i32, i32* %high
  %53 = sub i32 %52, 1
  %54 = getelementptr [10 x i32], [10 x i32]* @nums, i32 0, i32 %53
  %55 = load i32, i32* %54
  store i32 %55, i32* %51
  %56 = load i32, i32* %high
  %57 = sub i32 %56, 1
  %58 = getelementptr [10 x i32], [10 x i32]* @nums, i32 0, i32 %57
  %59 = load i32, i32* %temp
  store i32 %59, i32* %58
  %60 = load i32, i32* %i
  %61 = add i32 %60, 1
  store i32 %61, i32* %partion
  %62 = load i32, i32* %partion
  ret i32 %62

then2:                                            ; preds = %loop
  %63 = load i32, i32* %i
  %64 = add i32 %63, 1
  store i32 %64, i32* %i
  %65 = load i32, i32* %i
  %66 = sub i32 %65, 1
  %67 = getelementptr [10 x i32], [10 x i32]* @nums, i32 0, i32 %66
  %68 = load i32, i32* %67
  store i32 %68, i32* %temp
  %69 = load i32, i32* %i
  %70 = sub i32 %69, 1
  %71 = getelementptr [10 x i32], [10 x i32]* @nums, i32 0, i32 %70
  %72 = load i32, i32* %j
  %73 = sub i32 %72, 1
  %74 = getelementptr [10 x i32], [10 x i32]* @nums, i32 0, i32 %73
  %75 = load i32, i32* %74
  store i32 %75, i32* %71
  %76 = load i32, i32* %j
  %77 = sub i32 %76, 1
  %78 = getelementptr [10 x i32], [10 x i32]* @nums, i32 0, i32 %77
  %79 = load i32, i32* %temp
  store i32 %79, i32* %78
  br label %merge3

merge3:                                           ; preds = %then2, %loop
  %80 = load i32, i32* %j
  %81 = add i32 %80, 1
  store i32 %81, i32* %j
  %82 = load i32, i32* %j
  %83 = load i32, i32* %high
  %84 = icmp sge i32 %82, %83
  br i1 %84, label %end, label %loop
}

define void @quicksort(i32, i32) {
entry:
  %low = alloca i32
  store i32 %0, i32* %low
  %high = alloca i32
  store i32 %1, i32* %high
  %mid = alloca i32
  %2 = load i32, i32* %low
  %3 = load i32, i32* %high
  %4 = icmp slt i32 %2, %3
  %ifcond = icmp eq i1 %4, true
  br i1 %ifcond, label %then, label %merge

then:                                             ; preds = %entry
  %5 = load i32, i32* %low
  %6 = load i32, i32* %high
  %7 = call i32 @partion(i32 %5, i32 %6)
  store i32 %7, i32* %mid
  %8 = load i32, i32* %low
  %9 = load i32, i32* %mid
  %10 = sub i32 %9, 1
  call void @quicksort(i32 %8, i32 %10)
  %11 = load i32, i32* %mid
  %12 = add i32 %11, 1
  %13 = load i32, i32* %high
  call void @quicksort(i32 %12, i32 %13)
  br label %merge

merge:                                            ; preds = %then, %entry
  ret void
}

define i32 @main() {
entry:
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([57 x i8], [57 x i8]* @0, i32 0, i32 0))
  %1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @1, i32 0, i32 0))
  store i32 1, i32* @i
  %2 = load i32, i32* @i
  %3 = icmp sgt i32 %2, 10
  br i1 %3, label %end, label %loop

loop:                                             ; preds = %loop, %entry
  %4 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @2, i32 0, i32 0), i32* @x)
  %5 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @3, i32 0, i32 0))
  %6 = call i32 @getchar()
  %7 = load i32, i32* @i
  %8 = sub i32 %7, 1
  %9 = getelementptr [10 x i32], [10 x i32]* @nums, i32 0, i32 %8
  %10 = load i32, i32* @x
  store i32 %10, i32* %9
  %11 = load i32, i32* @i
  %12 = add i32 %11, 1
  store i32 %12, i32* @i
  %13 = load i32, i32* @i
  %14 = icmp sgt i32 %13, 10
  br i1 %14, label %end, label %loop

end:                                              ; preds = %loop, %entry
  %15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @4, i32 0, i32 0))
  %16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @5, i32 0, i32 0))
  store i32 1, i32* @i
  %17 = load i32, i32* @i
  %18 = icmp sgt i32 %17, 10
  br i1 %18, label %end2, label %loop1

loop1:                                            ; preds = %loop1, %end
  %19 = load i32, i32* @i
  %20 = sub i32 %19, 1
  %21 = getelementptr [10 x i32], [10 x i32]* @nums, i32 0, i32 %20
  %22 = load i32, i32* %21
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @6, i32 0, i32 0), i32 %22)
  %24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @7, i32 0, i32 0))
  %25 = load i32, i32* @i
  %26 = add i32 %25, 1
  store i32 %26, i32* @i
  %27 = load i32, i32* @i
  %28 = icmp sgt i32 %27, 10
  br i1 %28, label %end2, label %loop1

end2:                                             ; preds = %loop1, %end
  %29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @8, i32 0, i32 0))
  %30 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @9, i32 0, i32 0))
  call void @quicksort(i32 1, i32 10)
  %31 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @10, i32 0, i32 0))
  %32 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @11, i32 0, i32 0))
  store i32 1, i32* @i
  %33 = load i32, i32* @i
  %34 = icmp sgt i32 %33, 10
  br i1 %34, label %end4, label %loop3

loop3:                                            ; preds = %loop3, %end2
  %35 = load i32, i32* @i
  %36 = sub i32 %35, 1
  %37 = getelementptr [10 x i32], [10 x i32]* @nums, i32 0, i32 %36
  %38 = load i32, i32* %37
  %39 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @12, i32 0, i32 0), i32 %38)
  %40 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @13, i32 0, i32 0))
  %41 = load i32, i32* @i
  %42 = add i32 %41, 1
  store i32 %42, i32* @i
  %43 = load i32, i32* @i
  %44 = icmp sgt i32 %43, 10
  br i1 %44, label %end4, label %loop3

end4:                                             ; preds = %loop3, %end2
  ret i32 0
}

declare i32 @printf(i8*, ...)

declare i32 @scanf(i8*, ...)

declare i32 @getchar()
