program prop;
var
  n: array [0..10] of integer;
  i: integer;
  j: Integer;
begin
    Read(i);
    j := i;
    writeln('j = ', j);
    n[1] := i;
    writeln('n[1] = ', n[1]);
end.