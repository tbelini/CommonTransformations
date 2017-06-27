xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.smiles.com.br/EBO/Common/V1";
(:: import schema at "../../SmilesCanonico/EBO/Common/V1/SmilesHeader.xsd" ::)

declare variable $userId as xs:string external;
declare variable $username as xs:string external;
declare variable $messageTrackingId as xs:string external;
declare variable $language as xs:string external;
declare variable $channel as xs:string external;
declare variable $transactionId as xs:string external;

declare function local:createSmilesHeader($userId as xs:string, 
                                          $username as xs:string, 
                                          $messageTrackingId as xs:string, 
                                          $language as xs:string, 
                                          $channel as xs:string, 
                                          $transactionId as xs:string) 
                                          as element() (:: schema-element(ns1:SmilesHeader) ::) {
    <ns1:SmilesHeader>
        {
            if (fn:data($userId)) then
                <ns1:userId>{fn:data($userId)}</ns1:userId>
            else
                ()
        }
        {
            if (fn:data($username)) then
                <ns1:username>{fn:data($username)}</ns1:username>
            else
                ()
        }
        {
            if (fn:data($messageTrackingId)) then
                <ns1:messageTrackingId>{fn:data($messageTrackingId)}</ns1:messageTrackingId>
            else
                ()
        }
        {
            if (fn:data($language)) then
                <ns1:language>{fn:data($language)}</ns1:language>
            else
                ()
        }
        {
            if (fn:data($channel)) then
                <ns1:channel>{fn:data($channel)}</ns1:channel>
            else
                ()
        }
        {
            if (fn:data($transactionId)) then
                <ns1:transactionId>{fn:data($transactionId)}</ns1:transactionId>
            else
                ()
        }
    </ns1:SmilesHeader>
};

local:createSmilesHeader($userId, $username, $messageTrackingId, $language, $channel, $transactionId)