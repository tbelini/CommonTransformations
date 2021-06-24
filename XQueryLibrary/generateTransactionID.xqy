xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare variable $logicalNumber as xs:string external;


declare function local:reverse-string($arg as xs:string? ) as xs:string {
   codepoints-to-string(reverse(string-to-codepoints($arg)))
 } ;


declare function local:multiplySteps($step as xs:integer, $number as xs:string, $total as xs:integer) as xs:integer {
  let $toBeMultiplied := xs:integer(fn:substring($number, 1,1))
  
  let $total := $total + ($toBeMultiplied * $step)
  
  return if ($step = 13) then
    $total
  else
    local:multiplySteps($step + 1, fn:substring($number, 2), $total)
};


declare function local:generateTransactionID($logicalNumber as xs:string) as xs:string {
     
   let $currentTimeMillis := xs:integer((fn:current-dateTime() - xs:dateTime("1970-01-01T00:00:00-00:00")) div xs:dayTimeDuration("PT0.001S"))
   let $currentTimeMillisString := xs:string($currentTimeMillis)
   
   let $total := xs:string(local:multiplySteps(1, $currentTimeMillisString, 0))
   
   let $hash := fn:substring($total, fn:string-length($total) - 2)
   
   (:let $random := fn:substring($logicalNumber, fn:string-length($hash)):)
   
   let $currentTimeMillisStringReverse := local:reverse-string($currentTimeMillisString)
   
   let $transactionID := concat($logicalNumber,$hash,$currentTimeMillisStringReverse)

   return fn:substring($transactionID,1,16)
};

local:generateTransactionID($logicalNumber)