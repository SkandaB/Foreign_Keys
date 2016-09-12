<?php
include_once('config.php');
?>
<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <title>Foreign Keys - HW1</title>
</head>

<body>
    <p>
        <?php
            // Get form input.
            $firstName  = filter_input(INPUT_POST, "firstName");
            $lastName   = filter_input(INPUT_POST, "lastName");
            $profession = filter_input(INPUT_POST, "profession");
            $gender     = 'Male';
            $error      = "Something went wrong";

            if (filter_input(INPUT_POST, "gender") == 'female') {
                  $gender = 'Female';
            }

            try {
             // Connect to the database.
              $con = new PDO("mysql:host=" . $config["dbhost"] . ";dbname=" . $config["dbname"],
                             $config["dbuser"], $config["dbpass"]);
              $con->setAttribute(PDO::ATTR_ERRMODE,
                                 PDO::ERRMODE_EXCEPTION);

              $query = $con->prepare("INSERT INTO users(first_name, last_name, profession, gender)
                                      VALUES(?, ?, ?, ?)");
              $query->execute(array($firstName, $lastName, $profession, $gender));
              // echo 'Show table here';
              // header('Location: user_detail.html');
              header('Location: user_detail.php');
            }
            catch(PDOException $ex) {
                echo 'ERROR: '.$ex->getMessage();
            }

        ?>
    </p>
</body>
</html>
