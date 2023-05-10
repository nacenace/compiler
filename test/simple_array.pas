{单元测试:数组}
program prop;
var
  n: array [3..10] of integer;
  i: integer;
  j: Integer;
begin
    i := 5;
    Read(n[i]);
    j := i;
    n[n[i]] := j;
    writeln('n[', i, '] = ', n[i]);
    writeln('n[', n[i], '] = ', n[n[i]]);
end.