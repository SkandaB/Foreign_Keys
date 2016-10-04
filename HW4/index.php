<?php
include_once('PHP/tags.php');
?>

<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <title>Foreign Keys - HW4</title>
    <link href='static/css/main.css' rel='stylesheet' type='text/css'>
</head>

<body>
    <form action="PHP/search.php"
          method="post">
        <h4>Search By Tag</h4>
        <fieldset>
          <div>
               <label>Tag</label>
               <select name="tag">
                   <?php get_tags() ?>
               </select>
          </div>
          <div>
            <input type="submit" name="searchByTag" value="Find Posts" class="btn btn-primary"/>
          </div>
        </fieldset>
        <h4>Sort Users By Comment Count</h4>
        <fieldset>
          <div>
            <input type="submit" name="topCommentors" value="See Top Commentors" class="btn btn-primary"/>
          </div>
        </fieldset>
        <h4>Vote Count for Each Post</h4>
        <fieldset>
          <div>
            <input type="submit" name="voteCountByPost" value="Post Count" class="btn btn-primary"/>
          </div>
        </fieldset>
        <h4>Questions without any comments?</h4>
        <fieldset>
          <div>
            <input type="submit" name="questionNoComment" value="Questions No Comments" class="btn btn-primary"/>
          </div>
        </fieldset>
        <h4>Highest Voted posted Tag wise in Descending Order</h4>
        <fieldset>
          <div>
            <input type="submit" name="postByVotePerTag" value="Good answers Tag wise" class="btn btn-primary"/>
          </div>
        </fieldset>
    </form>

</body>
</html>
