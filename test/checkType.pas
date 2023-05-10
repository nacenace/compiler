{单元测试:类型检查}
program prog;
var
  i: integer;
  r: real;
begin
  i:= 10;
  r:= 3.14;
  if i = 10 then
  writeln('i is an integer: ',i);
  {隐式类型转换，整型赋值给实数型变量}
  writeln('把i赋给实数型变量r前,r的值: ',r);
  r := i; 
  writeln('把i赋给实数型变量r后,r的值: ',r);
end.
