{集中测试:常量(const),类型(type),变量(var),子程序(routine)部分}
program prog;
const
  pi = 3.14159;
type
  int = integer;
var
  i: Integer;
procedure mod3Value(c: int);
begin
  case c mod 3 of
    0: writeln('Red');
    1: writeln('Green');
    2: writeln('Blue');
  end;
end;
begin
  i := 100;
  writeln('const test');
  writeln(pi);
  writeln('test type and routine');
  write('7 mod 3 is: ');
  mod3Value(7);
end.
