xquery version "1.0" encoding "utf-8";

declare variable $pass as element(*) external;

declare function local:func($pass as element(*)) as element(*) {
    if(
        (
          xs:integer(substring($pass, 4, 1)) - xs:integer(substring($pass, 3, 1)) = 1 
          and xs:integer(substring($pass, 3, 1)) - xs:integer(substring($pass, 2, 1)) = 1
          and xs:integer(substring($pass, 2, 1)) - xs:integer(substring($pass, 1, 1)) = 1
        )
      or
        (
          xs:integer(substring($pass, 1, 1)) - xs:integer(substring($pass, 2, 1)) = 1
          and xs:integer(substring($pass, 2, 1)) - xs:integer(substring($pass, 3, 1)) = 1
          and xs:integer(substring($pass, 3, 1)) - xs:integer(substring($pass, 4, 1)) = 1
        )
      or
        (
          substring($pass, 1, 1) = substring($pass, 2, 1) 
          and substring($pass, 1, 1) = substring($pass, 3, 1)
          and substring($pass, 1, 1) = substring($pass, 4, 1)
        )
      )
    then(<validate>false</validate>)
    else(<validate>true</validate>)
};

local:func($pass)