{单元测试:过程和函数测试}
program prog;
var
  x: integer;
{计算自然数 x 及其前面所有自然数的和}
function f(x: integer): integer;
  begin
    if x = 0 then f := 0
    else f := f(x-1) + x;
  end;

procedure g(x: integer);
  var
    i: integer;
  begin
    for i := 1 to x do writeln(f(i));
  end;

begin
  writeln('Please input one integer x');
  readln(x);
  writeln('递归调用函数f(X)结果:');
  g(x);
end.
