xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

module namespace xql="http://www.smiles.com.br/Utility/XQueryLibrary/V1";

declare function xql:convertFromSiebelDateTime($dateTime as xs:string) as xs:dateTime {
    fn-bea:dateTime-from-string-with-format("dd/MM/yyyy HH:mm:ss", $dateTime)
};

declare function xql:convertToSiebelDateTime($dateTime as xs:dateTime) as xs:string {
    fn-bea:dateTime-to-string-with-format("dd/MM/yyyy HH:mm:ss", $dateTime)
};