{未定义变量}
Program prog;

var x, y : integer;
function gcd( a, b : integer) : integer;

begin
    if undefined_var = 0 Then gcd := a
    else gcd := gcd(b, a Mod b);
end;
begin
  read(x, y);
  write(gcd(x, y));
end.