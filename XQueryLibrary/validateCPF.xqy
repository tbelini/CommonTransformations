xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare variable $strCpf as xs:string external;


declare function local:isEmpty($cpfStr as xs:string) as xs:boolean {
    if ((fn:empty($cpfStr)) or (fn:string-length($cpfStr) <= 0)) then
        fn:true()
    else
        fn:false()
};

declare function local:removeMask($cpfFull as xs:string) as xs:string {
    let $cpfClean := fn:translate($cpfFull,"^[.,!?:...!#$%()*+,-./:;?@[\\\]_{|}~]+$","")
    
    return $cpfClean
    
};

declare function local:isDigit($cpfStr as xs:string) as xs:boolean {
    let $result := fn:matches($cpfStr, "(^\d{11}$)")
    return $result
};

declare function local:restDiv($somaTotal as xs:integer) as xs:integer {
    let $Resto := ($somaTotal * 10) mod 11
    return $Resto
};

declare function local:sumFirst($cpfNumber as xs:string) as xs:integer{
    
    let $Soma := fn:sum(
                        for $i in (1 to 9)
                        return
                              xs:integer(fn:substring($cpfNumber, $i, 1)) * (11 - $i)
                  )
    
    return local:restDiv($Soma)
};

declare function local:sumSecond($cpfNumber as xs:string) as xs:integer{
    let $Soma := fn:sum(
                        for $i in (1 to 10)
                        return
                             xs:integer(fn:substring($cpfNumber, $i, 1)) * (12 - $i)
                 )
    
    return local:restDiv($Soma)
};

declare function local:valueRest($restNumber as xs:integer) as xs:integer{
    let $value := if (($restNumber = 10) or ($restNumber = 11)) then (
                          0)
                      else ($restNumber)
    return $value
};

declare function local:testCPF($cpfFinal as xs:string) as xs:boolean {
   let $Result :=  if ($cpfFinal = "00000000000") then (
                      fn:false())
                   else (                      
                      if (local:valueRest(local:sumFirst($cpfFinal)) != fn:number(fn:substring($cpfFinal, 10, 1))) then (
                        fn:false())
                      else (
                        fn:true()
                      )
                   )
   let $Final :=  if ($Result = fn:false()) then (
                      fn:false())
                   else (                      
                      if (local:valueRest(local:sumSecond($cpfFinal)) != fn:number(fn:substring($cpfFinal, 11, 1))) then (
                        fn:false())
                      else (
                        fn:true()
                      )
                   )
	
   return $Final
   
};

declare function local:validateCPF($strCpf as xs:string) as xs:string {
    let $result := if (local:isEmpty($strCpf) = fn:true()) then (
                      "")
                   else (
                      if (local:isDigit(local:removeMask($strCpf)) = fn:true()) then (
                          fn:string(local:testCPF(local:removeMask($strCpf))))
                      else (
                          fn:string(fn:false())
                      )
                   )
    
        
    return $result
};

local:validateCPF($strCpf)
