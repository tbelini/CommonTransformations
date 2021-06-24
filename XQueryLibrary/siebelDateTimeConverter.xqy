xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

module namespace xql="http://www.smls.com.br/Utility/XQueryLibrary/V1";

declare function xql:convertFromSiebelDateTime($dateTime as xs:string) as xs:dateTime {
    if (string-length($dateTime) = 10) then
      fn-bea:dateTime-from-string-with-format("MM/dd/yyyy", $dateTime)
    else
      fn-bea:dateTime-from-string-with-format("MM/dd/yyyy HH:mm:ss", $dateTime)
};

declare function xql:convertToSiebelDateTime($dateTime as xs:dateTime) as xs:string {
    fn-bea:dateTime-to-string-with-format("MM/dd/yyyy HH:mm:ss", $dateTime)
};

declare function xql:convertFromSiebelDate($date as xs:string) as xs:date {
    fn-bea:date-from-string-with-format("MM/dd/yyyy", $date)
};

declare function xql:convertToSiebelDate($date as xs:date) as xs:string {
    fn-bea:date-to-string-with-format("MM/dd/yyyy", $date)
};

declare function xql:convertToSiebelDateTimeZero($date as xs:date) as xs:string {
    concat(fn-bea:date-to-string-with-format("MM/dd/yyyy", $date), ' 00:00:00')
};

declare function xql:convertToSiebelTimeStamp($dateTime as xs:dateTime) as xs:string {
    fn-bea:dateTime-to-string-with-format("yyyy-MM-dd", $dateTime)
};

declare function xql:convertToSiebelDateTimeStamp($dateTime as xs:dateTime) as xs:string {
    fn-bea:dateTime-to-string-with-format("yyyy-MM-dd HH:mm:ss", $dateTime)
};
