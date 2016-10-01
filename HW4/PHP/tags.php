<?php
//include_once('PHP/config.php');
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

        // set the resulting array to associative
        $stmt->setFetchMode(PDO::FETCH_ASSOC);

        $results = array();

        foreach(new RecursiveArrayIterator($stmt->fetchAll()) as $k=>$v) {
            array_push($results, $v);
            $html .= '<option value='.$v['id'].'>'.$v['name'].'</option>';
        }
    }
    catch(PDOException $ex) {
        echo 'ERROR: '.$ex->getMessage();
    }
    echo $html;
}
?>
