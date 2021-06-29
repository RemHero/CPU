entity xor1 is
port(a,b: in bit;
c: out bit);
end xor1;

architecture lyh of xor1 is
begin
c <= (a and (not b))or((not a) and b);
end lyh;