; ModuleID = 'main'
source_filename = "main"

@a = internal global i32 0
@b = internal global i32 0
@c = internal global double 0.000000e+00
@d = internal global double 0.000000e+00
@ch = internal global i8 0
@e = internal global i1 false
@0 = private unnamed_addr constant [34 x i8] c"Please input two integers x and y\00", align 1
@1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@3 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@4 = private unnamed_addr constant [7 x i8] c"%*[^\0A]\00", align 1
@5 = private unnamed_addr constant [6 x i8] c"-a = \00", align 1
@6 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@7 = private unnamed_addr constant [8 x i8] c", -b = \00", align 1
@8 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@9 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@10 = private unnamed_addr constant [11 x i8] c"a  +  b = \00", align 1
@11 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@12 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@13 = private unnamed_addr constant [11 x i8] c"a  -  b = \00", align 1
@14 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@15 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@16 = private unnamed_addr constant [11 x i8] c"a  *  b = \00", align 1
@17 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@18 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@19 = private unnamed_addr constant [11 x i8] c"a  /  b = \00", align 1
@20 = private unnamed_addr constant [4 x i8] c"%lf\00", align 1
@21 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@22 = private unnamed_addr constant [11 x i8] c"a div b = \00", align 1
@23 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@24 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@25 = private unnamed_addr constant [11 x i8] c"a mod b = \00", align 1
@26 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@27 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@28 = private unnamed_addr constant [11 x i8] c"a xor b = \00", align 1
@29 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@30 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@31 = private unnamed_addr constant [16 x i8] c"sqrt(abs(a)) = \00", align 1
@32 = private unnamed_addr constant [4 x i8] c"%lf\00", align 1
@33 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@34 = private unnamed_addr constant [32 x i8] c"Please input two floats c and d\00", align 1
@35 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@36 = private unnamed_addr constant [4 x i8] c"%lf\00", align 1
@37 = private unnamed_addr constant [4 x i8] c"%lf\00", align 1
@38 = private unnamed_addr constant [7 x i8] c"%*[^\0A]\00", align 1
@39 = private unnamed_addr constant [9 x i8] c"c + d = \00", align 1
@40 = private unnamed_addr constant [4 x i8] c"%lf\00", align 1
@41 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@42 = private unnamed_addr constant [9 x i8] c"c - d = \00", align 1
@43 = private unnamed_addr constant [4 x i8] c"%lf\00", align 1
@44 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@45 = private unnamed_addr constant [9 x i8] c"c * d = \00", align 1
@46 = private unnamed_addr constant [4 x i8] c"%lf\00", align 1
@47 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@48 = private unnamed_addr constant [9 x i8] c"c / d = \00", align 1
@49 = private unnamed_addr constant [4 x i8] c"%lf\00", align 1
@50 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@51 = private unnamed_addr constant [16 x i8] c"sqrt(abs(c)) = \00", align 1
@52 = private unnamed_addr constant [4 x i8] c"%lf\00", align 1
@53 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@54 = private unnamed_addr constant [9 x i8] c"a + c = \00", align 1
@55 = private unnamed_addr constant [4 x i8] c"%lf\00", align 1
@56 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@57 = private unnamed_addr constant [9 x i8] c"b * d = \00", align 1
@58 = private unnamed_addr constant [4 x i8] c"%lf\00", align 1
@59 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@60 = private unnamed_addr constant [17 x i8] c"true and false: \00", align 1
@61 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@62 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@63 = private unnamed_addr constant [16 x i8] c"true or false: \00", align 1
@64 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@65 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@66 = private unnamed_addr constant [11 x i8] c"not true: \00", align 1
@67 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@68 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@69 = private unnamed_addr constant [8 x i8] c"a > b: \00", align 1
@70 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@71 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@72 = private unnamed_addr constant [30 x i8] c"Please input one character ch\00", align 1
@73 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@74 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@75 = private unnamed_addr constant [17 x i8] c"chr(ord(ch))  = \00", align 1
@76 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@77 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@78 = private unnamed_addr constant [12 x i8] c"pred(ch) = \00", align 1
@79 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@80 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@81 = private unnamed_addr constant [12 x i8] c"succ(ch) = \00", align 1
@82 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@83 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

define i32 @sum(i32, i32) {
entry:
  %a = alloca i32
  store i32 %0, i32* %a
  %b = alloca i32
  store i32 %1, i32* %b
  %sum = alloca i32
  %2 = load i32, i32* %a
  %3 = load i32, i32* %b
  %4 = add i32 %2, %3
  store i32 %4, i32* %sum
  %5 = load i32, i32* %sum
  ret i32 %5
}

define i32 @main() {
entry:
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @0, i32 0, i32 0))
  %1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @1, i32 0, i32 0))
  %2 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @2, i32 0, i32 0), i32* @a)
  %3 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @3, i32 0, i32 0), i32* @b)
  %4 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @4, i32 0, i32 0))
  %5 = call i32 @getchar()
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @5, i32 0, i32 0))
  %7 = load i32, i32* @a
  %8 = sub i32 0, %7
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @6, i32 0, i32 0), i32 %8)
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @7, i32 0, i32 0))
  %11 = load i32, i32* @b
  %12 = sub i32 0, %11
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @8, i32 0, i32 0), i32 %12)
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @9, i32 0, i32 0))
  %15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @10, i32 0, i32 0))
  %16 = load i32, i32* @a
  %17 = load i32, i32* @b
  %18 = add i32 %16, %17
  %19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @11, i32 0, i32 0), i32 %18)
  %20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @12, i32 0, i32 0))
  %21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @13, i32 0, i32 0))
  %22 = load i32, i32* @a
  %23 = load i32, i32* @b
  %24 = sub i32 %22, %23
  %25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0), i32 %24)
  %26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @15, i32 0, i32 0))
  %27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @16, i32 0, i32 0))
  %28 = load i32, i32* @a
  %29 = load i32, i32* @b
  %30 = mul i32 %28, %29
  %31 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @17, i32 0, i32 0), i32 %30)
  %32 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @18, i32 0, i32 0))
  %33 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @19, i32 0, i32 0))
  %34 = load i32, i32* @a
  %35 = load i32, i32* @b
  %36 = sitofp i32 %34 to double
  %37 = sitofp i32 %35 to double
  %38 = fdiv double %36, %37
  %39 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @20, i32 0, i32 0), double %38)
  %40 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @21, i32 0, i32 0))
  %41 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @22, i32 0, i32 0))
  %42 = load i32, i32* @a
  %43 = load i32, i32* @b
  %44 = sdiv i32 %42, %43
  %45 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @23, i32 0, i32 0), i32 %44)
  %46 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @24, i32 0, i32 0))
  %47 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @25, i32 0, i32 0))
  %48 = load i32, i32* @a
  %49 = load i32, i32* @b
  %50 = srem i32 %48, %49
  %51 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @26, i32 0, i32 0), i32 %50)
  %52 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @27, i32 0, i32 0))
  %53 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @28, i32 0, i32 0))
  %54 = load i32, i32* @a
  %55 = load i32, i32* @b
  %56 = xor i32 %54, %55
  %57 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @29, i32 0, i32 0), i32 %56)
  %58 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @30, i32 0, i32 0))
  %59 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @31, i32 0, i32 0))
  %60 = load i32, i32* @a
  %61 = uitofp i32 %60 to double
  %62 = call double @fabs(double %61)
  %63 = call double @sqrt(double %62)
  %64 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @32, i32 0, i32 0), double %63)
  %65 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @33, i32 0, i32 0))
  %66 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @34, i32 0, i32 0))
  %67 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @35, i32 0, i32 0))
  %68 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @36, i32 0, i32 0), double* @c)
  %69 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @37, i32 0, i32 0), double* @d)
  %70 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @38, i32 0, i32 0))
  %71 = call i32 @getchar()
  %72 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @39, i32 0, i32 0))
  %73 = load double, double* @c
  %74 = load double, double* @d
  %75 = fadd double %73, %74
  %76 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @40, i32 0, i32 0), double %75)
  %77 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @41, i32 0, i32 0))
  %78 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @42, i32 0, i32 0))
  %79 = load double, double* @c
  %80 = load double, double* @d
  %81 = fsub double %79, %80
  %82 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @43, i32 0, i32 0), double %81)
  %83 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @44, i32 0, i32 0))
  %84 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @45, i32 0, i32 0))
  %85 = load double, double* @c
  %86 = load double, double* @d
  %87 = fmul double %85, %86
  %88 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @46, i32 0, i32 0), double %87)
  %89 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @47, i32 0, i32 0))
  %90 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @48, i32 0, i32 0))
  %91 = load double, double* @c
  %92 = load double, double* @d
  %93 = fdiv double %91, %92
  %94 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @49, i32 0, i32 0), double %93)
  %95 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @50, i32 0, i32 0))
  %96 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @51, i32 0, i32 0))
  %97 = load double, double* @c
  %98 = call double @fabs(double %97)
  %99 = call double @sqrt(double %98)
  %100 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @52, i32 0, i32 0), double %99)
  %101 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @53, i32 0, i32 0))
  %102 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @54, i32 0, i32 0))
  %103 = load i32, i32* @a
  %104 = load double, double* @c
  %105 = sitofp i32 %103 to double
  %106 = fadd double %105, %104
  %107 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @55, i32 0, i32 0), double %106)
  %108 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @56, i32 0, i32 0))
  %109 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @57, i32 0, i32 0))
  %110 = load i32, i32* @b
  %111 = load double, double* @d
  %112 = sitofp i32 %110 to double
  %113 = fmul double %112, %111
  %114 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @58, i32 0, i32 0), double %113)
  %115 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @59, i32 0, i32 0))
  store i1 false, i1* @e
  %116 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @60, i32 0, i32 0))
  %117 = load i1, i1* @e
  %118 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @61, i32 0, i32 0), i1 %117)
  %119 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @62, i32 0, i32 0))
  store i1 true, i1* @e
  %120 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @63, i32 0, i32 0))
  %121 = load i1, i1* @e
  %122 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @64, i32 0, i32 0), i1 %121)
  %123 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @65, i32 0, i32 0))
  store i1 false, i1* @e
  %124 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @66, i32 0, i32 0))
  %125 = load i1, i1* @e
  %126 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @67, i32 0, i32 0), i1 %125)
  %127 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @68, i32 0, i32 0))
  %128 = load i32, i32* @a
  %129 = load i32, i32* @b
  %130 = icmp sgt i32 %128, %129
  store i1 %130, i1* @e
  %131 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @69, i32 0, i32 0))
  %132 = load i1, i1* @e
  %133 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @70, i32 0, i32 0), i1 %132)
  %134 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @71, i32 0, i32 0))
  %135 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @72, i32 0, i32 0))
  %136 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @73, i32 0, i32 0))
  %137 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @74, i32 0, i32 0), i8* @ch)
  %138 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @75, i32 0, i32 0))
  %139 = load i8, i8* @ch
  %140 = zext i8 %139 to i32
  %141 = trunc i32 %140 to i8
  %142 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @76, i32 0, i32 0), i8 %141)
  %143 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @77, i32 0, i32 0))
  %144 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @78, i32 0, i32 0))
  %145 = load i8, i8* @ch
  %146 = sub i8 %145, 1
  %147 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @79, i32 0, i32 0), i8 %146)
  %148 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @80, i32 0, i32 0))
  %149 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @81, i32 0, i32 0))
  %150 = load i8, i8* @ch
  %151 = add i8 %150, 1
  %152 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @82, i32 0, i32 0), i8 %151)
  %153 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @83, i32 0, i32 0))
  ret i32 0
}

declare i32 @printf(i8*, ...)

declare i32 @scanf(i8*, ...)

declare i32 @getchar()

declare double @sqrt(double)

declare double @fabs(double)
