(: You can activate the content completion by pressing the Ctrl+Space keys. :)
xquery version "1.0";

(: Namespace for the <oXygen/> custom functions and variables :)
declare namespace oxy="http://www.oxygenxml.com/xquery/functions";

(: The XML document :)
declare variable $oxy:catalog as document-node() := doc("catalog.xml");

(: Lists the expensive books :)
declare function oxy:list-all-albums($document as document-node()) {
  
        let $seq := $document//album/@title
        let $distinct := distinct-values($seq)
  
        for $a in $distinct
        order by $a
           return
              <album>
                 <name> {$a} </name>
                 {
                     for $artist in $document/catalog/artist
                     where $artist/album/@title = $a
                     return <artist>{data($artist/@title)}</artist>
                 }
              </album> 
};

<result>
{oxy:list-all-albums($oxy:catalog)}
</result>
