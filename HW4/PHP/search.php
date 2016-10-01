<?php
//include_once('PHP/config.php');
function  build_table(){
  include_once('config.php');

	$html='';
    try
    {
            // Connect to the database.
        $con = new PDO("mysql:host=" . $config["dbhost"] . ";dbname=" . $config["dbname"],
                                 $config["dbuser"], $config["dbpass"]);
        $con->setAttribute(PDO::ATTR_ERRMODE,
                           PDO::ERRMODE_EXCEPTION);

        if (isset($_POST['searchByTag']))   {
           $tag_id  = filter_input(INPUT_POST, "tag");
           //First join with three tables
           $stmt = $con->prepare("SELECT * FROM question_tag qt
                                           inner join question q on qt.question_id = q.id
                                           inner join post p on q.post_id = p.id
                                           WHERE qt.tag_id = ?");
           $stmt->execute(array($tag_id));
           $stmt->setFetchMode(PDO::FETCH_ASSOC);// set the resulting array to associative
           $results = array();

           foreach(new RecursiveArrayIterator($stmt->fetchAll()) as $k=>$v) {
               array_push($results, $v);
               $html .= '<tr><td>'.$v['body'].'</td><td>'.$v['body'].'</td></tr>';
           }

         } else if ( isset($_POST['topCommentors']) )   {
           $stmt = $con->prepare(" SELECT u.full_name, COUNT(c.user_id) AS comment_count
                                   FROM comment c INNER JOIN user u
                                   ON c.user_id=u.id
                                   GROUP BY c.user_id
                                   order by count(*) desc");
           $stmt->execute();
           $stmt->setFetchMode(PDO::FETCH_ASSOC);// set the resulting array to associative
           $results = array();

           foreach(new RecursiveArrayIterator($stmt->fetchAll()) as $k=>$v) {
               array_push($results, $v);
               $html .= '<tr><td>'.$v['full_name'].'</td><td>'.$v['comment_count'].'</td></tr>';
           }
         }

    }
    catch(PDOException $ex) {
        echo 'ERROR: '.$ex->getMessage();
    }
    echo $html;
}
?>

<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <title>Foreign Keys - HW4</title>
    <link href='../static/css/main.css' rel='stylesheet' type='text/css'>
</head>

<body>
  <table>
    <tr>
      <th>User Name</th>
      <th>Question</th>
    </tr>
     <?php build_table() ?>
   </table>
</body>
</html>
