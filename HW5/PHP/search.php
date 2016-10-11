<?php
//include_once('PHP/config.php');

class Commenter
{
    private $userId;
    private $fullName;
    private $commentCount;

    public function getUserId()     { return $this->userId; }
    public function getFullName()   { return $this->fullName; }
    public function getCommentCount()   { return $this->commentCount; }
}

function getTopCommentersRowHTML(Commenter $commenter) {
    return '<tr><td>'.$commenter->getFullName().'</td><td>'.$commenter->getCommentCount().'</td></tr>';
}

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

           $html .=  '<tr><th>Content</th><th>Creation Time</th></tr>';
           foreach(new RecursiveArrayIterator($stmt->fetchAll()) as $k=>$v) {
               array_push($results, $v);
               $html .= '<tr><td>'.$v['body'].'</td><td>'.$v['created_timestamp'].'</td></tr>';
           }

         } else if ( isset($_POST['topCommentors']) )   {
           $stmt = $con->prepare(" SELECT u.full_name as fullName, c.user_id as userId, COUNT(c.user_id) as commentCount
                                   FROM comment c INNER JOIN user u
                                   ON c.user_id=u.id
                                   GROUP BY c.user_id
                                   HAVING count(*) > 1
                                   order by count(*) desc");
           $stmt->execute();
           $stmt->setFetchMode(PDO::FETCH_CLASS, "Commenter");

           $html .=  '<tr><th>Name</th><th>Comment Count</th></tr>';
	   while ($commenter = $stmt->fetch()) {
                $html .= getTopCommentersRowHTML($commenter);
	   }
         } else if ( isset($_POST['voteCountByPost']) )   {
           $stmt = $con->prepare(" SELECT p.body, COUNT(v.post_id) AS vote_count
                                   FROM vote v INNER JOIN post p
                                   ON v.post_id=p.id
                                   GROUP BY v.post_id
                                   order by count(*) desc");
           $stmt->execute();
           $stmt->setFetchMode(PDO::FETCH_ASSOC);// set the resulting array to associative
           $results = array();

           $html .=  '<tr><th>Post</th><th>Vote Count</th></tr>';
           foreach(new RecursiveArrayIterator($stmt->fetchAll()) as $k=>$v) {
               array_push($results, $v);
               $html .= '<tr><td>'.$v['body'].'</td><td>'.$v['vote_count'].'</td></tr>';
           }
         } else if ( isset($_POST['questionNoComment']) )   {
           $stmt = $con->prepare(" SELECT p.body
                                   FROM question q INNER JOIN post p
                                   ON q.post_id=p.id
                                   LEFT JOIN comment c
                                   ON p.id=c.post_id
                                   WHERE c.post_id is NULL
                                   GROUP BY p.id");
           $stmt->execute();
           $stmt->setFetchMode(PDO::FETCH_ASSOC);// set the resulting array to associative
           $results = array();

           $html .=  '<tr><th>Post</th></tr>';
           foreach(new RecursiveArrayIterator($stmt->fetchAll()) as $k=>$v) {
               array_push($results, $v);
               $html .= '<tr><td>'.$v['body'].'</td></tr>';
           }
         } else if ( isset($_POST['postByVotePerTag']) )   {
           $stmt = $con->prepare(" SELECT p.body, a.post_id, a.question_id, qt.tag_id, t.name, COUNT(v.post_id) AS vote_count
                                   FROM post p
                                   INNER JOIN answer a ON p.id=a.post_id
                                   INNER JOIN question_tag qt ON qt.question_id=a.question_id
                                   INNER JOIN tag t ON t.id=qt.tag_id
                                   INNER JOIN vote v ON v.post_id=a.post_id
                                   GROUP BY t.name
                                   ORDER BY COUNT(*) desc");
           $stmt->execute();
           $stmt->setFetchMode(PDO::FETCH_ASSOC);// set the resulting array to associative
           $results = array();

           $html .=  '<tr><th>Tag</th><th>Post</th><th>Vote Count</th></tr>';
           foreach(new RecursiveArrayIterator($stmt->fetchAll()) as $k=>$v) {
               array_push($results, $v);
               $html .= '<tr><td>'.$v['name'].'</td><td>'.$v['body'].'</td><td>'.$v['vote_count'].'</td></tr>';
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
     <?php build_table() ?>
   </table>
</body>
</html>
