{测试gcd}
program prog;
var x, y : integer;
function gcd(a, b : integer) : integer;
    begin
        if b = 0 then gcd := a
        else gcd := gcd(b, a mod b);
    end;
begin
  writeln('Please input two integers x and y, and I will return you their greatest common divisor.');
  read(x, y);
  writeln(gcd(x, y));
end.
