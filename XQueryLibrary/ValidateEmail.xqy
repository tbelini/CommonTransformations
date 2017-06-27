xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare variable $email as xs:string external;


declare function local:number-of-matches($inputArg as xs:string, $pattern as xs:string) as xs:integer {
   fn:count(fn:tokenize($inputArg, $pattern)) - 1
 };


declare function local:usuario($inputEmail as xs:string) as xs:string {
  let $usuario := fn:substring-before($inputEmail, '@')
  return $usuario
};


declare function local:dominio($inputEmail as xs:string) as xs:string {
  let $dominio := fn:substring-after($inputEmail, '@')
  return $dominio
};


declare function local:func($email as xs:string) as xs:boolean {
    let $usuario := local:usuario($email)
    let $dominio := local:dominio($email)
    
    let $result:= if ((fn:string-length($usuario) >= 1) and
                      (fn:string-length($dominio) >= 3) and
                      (local:number-of-matches($usuario, "@") = 0) and
                      (local:number-of-matches($dominio, "@") = 0) and
                      (local:number-of-matches($usuario, " ") = 0) and
                      (local:number-of-matches($dominio, " ") = 0) and
                      (local:number-of-matches($dominio, ".") >= 1) and
                      (fn:string-length(fn:substring-after($dominio, ".")) >=1) and
                      (fn:string-length(fn:substring-after($dominio, ".")) < fn:string-length($dominio) - 1)) then
                    fn:true()
                  else
                    fn:false()
                    
    return $result
};

local:func($email)
