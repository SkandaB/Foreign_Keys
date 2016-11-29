for $art in
    doc("catalog.xml")
    //song
    
for $play in
    doc("playlist.xml")
    //song

    
where
    $art = $play
    
order by
    $art/title
    
return 
    ($art/title, $art/length)