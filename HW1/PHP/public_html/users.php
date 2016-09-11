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
            $firstName     = filter_input(INPUT_POST, "firstName");
            $lastName = filter_input(INPUT_POST, "lastName");
            $profession = filter_input(INPUT_POST, "profession");
            $error     = "Something went wrong";


            try {
             // Connect to the database.
              $con = new PDO("mysql:host=localhost;dbname=foreignkeys",
                             "foreignkeys", "nonosql");
              $con->setAttribute(PDO::ATTR_ERRMODE,
                                 PDO::ERRMODE_EXCEPTION);

              $query = $con->prepare("INSERT INTO users(first_name, last_name, profession)
                                      VALUES(?, ?, ?)");
              $query->execute(array($firstName, $lastName, $profession));
              echo 'Show table here';
            }
            catch(PDOException $ex) {
                echo 'ERROR: '.$ex->getMessage();
            }

        ?>
    </p>
</body>
</html>
