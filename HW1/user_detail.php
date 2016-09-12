<?php
function build_table(){
	include('config.php');
	
	$html='';
    try 
    {
            // Connect to the database.
        $con = new PDO("mysql:host=" . $config["dbhost"] . ";dbname=" . $config["dbname"],
                                 $config["dbuser"], $config["dbpass"]);
        $con->setAttribute(PDO::ATTR_ERRMODE,
                                     PDO::ERRMODE_EXCEPTION);

        $stmt = $con->prepare("SELECT * FROM users");
        $stmt->execute();

        // set the resulting array to associative
        $stmt->setFetchMode(PDO::FETCH_ASSOC); 

        $results = array();

        foreach(new RecursiveArrayIterator($stmt->fetchAll()) as $k=>$v) {
            array_push($results, $v);
            $html .= '<tr>';
            $html .= '<td>'.$v['first_name'].'</td>';
            $html .= '<td>'.$v['last_name'].'</td>';
            $html .= '<td>'.$v['profession'].'</td>';
            $html .= '<td>'.$v['gender'].'</td>';
            $html .= '</tr>';
        }        
    }
    catch(PDOException $ex) {
        echo 'ERROR: '.$ex->getMessage();
    }
    return $html;
}

$html  = '<!DOCTYPE html>';
$html .= '<html lang="en-US">';
$html .= '<head>';
$html .= '    <meta charset="UTF-8">';
$html .= '    <title>Foreign Keys - HW1 - User Detail</title>';
$html .= '    <link href="static/css/main.css" rel="stylesheet" type="text/css">';
$html .= '</head>';
$html .= '<body>';
$html .= '    <table>';
$html .= '        <tr>';
$html .= '            <th>First Name</th>';
$html .= '            <th>Last Name</th>';
$html .= '            <th>Profession</th>';
$html .= '            <th>Gender</th>';
$html .= '        </tr>';
$html .= build_table();
$html .= '    </table>';
$html .= '</body>';
$html .= '</html>';

echo $html;
?>