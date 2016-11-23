for $art in
    doc("catalog.xml")
    //artist
    
for $conc in
    doc("concert.xml")
    //concert
    
where
    $art/@country = $conc/country
    
   
return 
    $conc/country