(: You can activate the content completion by pressing the Ctrl+Space keys. :)
xquery version "1.0";

(: Namespace for the <oXygen/> custom functions and variables :)
declare namespace oxy="http://www.oxygenxml.com/xquery/functions";

(: The XML document :)
declare variable $oxy:catalog as document-node() := doc("catalog.xml");

(: Lists the expensive books :)
declare function oxy:list-by-country($document as document-node()) {
  
        for $artist in $document//artist
           order by $artist/@country 
           return
              <artist>
                 {$artist/@title}
                 {$artist/@country}
              </artist>
};

<result>
{oxy:list-by-country($oxy:catalog)}
</result>
