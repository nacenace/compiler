{单元测试:测试注释以及writeln函数,write,read,readln函数}
program prog;
var x, y : integer;
begin
  {测试注释以及writeln函数,write,read,readln函数}
  (*注释的另一种表示形式
    忽略
    忽略
  *)
  write('hello the world ');
  writeln('Please input two integers x and y');
  read(x);
  readln(y);
  write(y);
  writeln(x);
  
end.
