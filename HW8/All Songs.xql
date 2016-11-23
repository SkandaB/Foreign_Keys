(: You can activate the content completion by pressing the Ctrl+Space keys. :)
xquery version "1.0";

(: Namespace for the <oXygen/> custom functions and variables :)
declare namespace oxy="http://www.oxygenxml.com/xquery/functions";

(: The XML document :)
declare variable $oxy:catalog as document-node() := doc("catalog.xml");

(: Lists the expensive books :)
declare function oxy:list-all-songs($document as document-node()) {
  
        let $seq := $document//song/title
        let $distinct := distinct-values($seq)
  
        for $a in $distinct
           return
              <song>
                 <name> {$a} </name>
                 {
                     for $artist in $document/catalog/artist
                     where $artist/album/song/title = $a
                     return <artist>{data($artist/@title)}</artist>
                 }
                 {
                     for $album in $document//album
                     where $album/song/title = $a
                     return <album>{data($album/@title)}</album>
                 }
              </song> 
};

<result>
{oxy:list-all-songs($oxy:catalog)}
</result>
