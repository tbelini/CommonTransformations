declare function xf:left-pad-string-to-length
  ( $stringToPad1 as xs:string? ,
    $padChar as xs:string ,
    $length as xs:integer )  as xs:string {
       
   substring(
     string-join (
       (for $i in (1 to $length - string-length($stringToPad1)) return $padChar, $stringToPad1)
       ,'')
    ,1,$length)
 } ;