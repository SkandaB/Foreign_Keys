<?php

class Tag
{
    private $id;
    private $name;

    public function getId()     { return $this->id; }
    public function getName()   { return $this->name; }
}

function createTagOption(Tag $t){
  return '<option value='. $t->getId() .'>'. $t->getName() .'</option>';
}

function get_tags(){
    include_once('PHP/config.php');
    
    $html='';
    try
    {
            // Connect to the database.
        $con = new PDO("mysql:host=" . $config["dbhost"] . ";dbname=" . $config["dbname"],
                                 $config["dbuser"], $config["dbpass"]);
        $con->setAttribute(PDO::ATTR_ERRMODE,
                                     PDO::ERRMODE_EXCEPTION);

        $stmt = $con->prepare("SELECT * FROM tag");
        $stmt->execute();
        $stmt->setFetchMode(PDO::FETCH_CLASS, "Tag");

        while ($tag = $stmt->fetch()) {
          $html .= createTagOption($tag);
        }
    }
    catch(PDOException $ex) {
        echo 'ERROR: '.$ex->getMessage();
    }
    echo $html;
}
?>
