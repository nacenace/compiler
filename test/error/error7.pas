{参数个数问题}
Program prog;

var x, y : integer;
function gcd( a, b : integer) : integer;
begin
  if b = 0 Then gcd := a
  else gcd := gcd(b, a mod b, a);
end;
begin
  read(x, y);
  write(gcd(x, y));
End.