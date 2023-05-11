{单元测试用例:系统函数}
program prog;
var
  a : Integer = -2;
  b : Real = -5.0;
  c : record
    d : array [1..10] of Integer;
  end;
begin
  writeln('-2的绝对值: ',abs(a));
  WriteLn('-5.0的绝对值: ',Abs(b));
  c.d[1] := -15;
  WriteLn(Abs(c.d[1]));
end.