(: You can activate the content completion by pressing the Ctrl+Space keys. :)
xquery version "1.0";

(: Namespace for the <oXygen/> custom functions and variables :)
declare namespace oxy="http://www.oxygenxml.com/xquery/functions";

(: The XML document :)
declare variable $oxy:catalog as document-node() := doc("catalog.xml");

(: Lists the expensive books :)
declare function oxy:list-albums-by-genre($document as document-node(), $genre as xs:string) {
  
     for $artist in $document/catalog/artist
     where $artist/@genre = $genre
     return <ul><li>{data($artist/@title)}<ol>
                {
                     for $album in $artist/album
                     return <li>{data($album/@title)}</li>
                 }
            </ol></li></ul>
};

<html>
<head>
</head>
<body>
{oxy:list-albums-by-genre($oxy:catalog,"Alternative Rock")}
</body>
</html>
