xquery version "1.0" encoding "utf-8";

declare variable $smlsNumber as element() external;

declare function local:func($smlsNumber as element()) as xs:boolean {

    if(string-length(data($smlsNumber/text())) != xs:integer("9"))then(
    	false()
    )else(
    	let $number := xs:integer(substring(data($smlsNumber/text()), 1,8))
    	let $lastDigit := xs:integer(substring(data($smlsNumber/text()), 9))
    	return
    			if(xs:integer(data($lastDigit)) > xs:integer("6"))then(
    				false()
    			)else(
    				let $result := $number - (xs:int($number div 7) * 7)
    				return
    					if($result = $lastDigit)then(
    						true()
    					)else(
    						false()
    					)
    			)
    )
    

};

local:func($smlsNumber)