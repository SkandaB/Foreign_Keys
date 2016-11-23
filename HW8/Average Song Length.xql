(: You can activate the content completion by pressing the Ctrl+Space keys. :)
xquery version "1.0";

(: Namespace for the <oXygen/> custom functions and variables :)
declare namespace oxy="http://www.oxygenxml.com/xquery/functions";

(: The XML document :)
declare variable $oxy:catalog as document-node() := doc("catalog.xml");

(: The average price of the books :)
declare variable $oxy:average-length as xs:double := avg($oxy:catalog//song/length);

(: Lists the expensive books :)
declare function oxy:list-average-length($document as document-node(), $average-length as xs:double) {
  
        for $s in $document//song
           where $s/length > $average-length
           return
              <song>
                 {$s/title/text()}
                 <current_length>
                     {$s/length/text()}
                 </current_length>
                 <length_difference>
                    {format-number($s/length - $average-length,".00")} 
                 </length_difference>
              </song>
};

<result>
  <average_length>{format-number($oxy:average-length,".00")}</average_length> 
  {oxy:list-average-length($oxy:catalog, $oxy:average-length)}
</result>
