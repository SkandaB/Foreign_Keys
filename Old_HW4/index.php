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
    </form>

</body>
</html>
