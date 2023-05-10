program prog;
var
  a : Integer = -2;
  b : Real = -5.0;
  c : record
    d : array [1..10] of Integer;
  end;
begin
  writeln(abs(a));
  WriteLn(Abs(b));
  c.d[1] := -15;
  WriteLn(Abs(c.d[1]));
end.