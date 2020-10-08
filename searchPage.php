<!DOCTYPE HTML>
<html>
<head>
<style>
.error {color: #FF0000;}
</style>
</head>
<body>

<?php
// define variables and set to empty values
$err = "";
$name = $class = $predator  = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
  if (empty($_POST["name"]) && empty($_POST["class"]) && empty($_POST["predator"])) {
    $err = "At least one field is required";
  } else {
      $name = test_input($_POST["name"]);
      $class = test_input($_POST["class"]);
      $predator = test_input($_POST["predator"]);
      $err = "";
    // figure out which one isn't empty and search
  }
  
}

function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}
?>

<h2>PHP Form Validation Example</h2>
<p><span class="error">* required field</span></p>
<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
  Name: <input type="text" name="name" value="<?php echo $name;?>">
  <span class="error"></span>
  <br><br>
  Class: <input type="text" name="class" value="<?php echo $class;?>">
  <span class="error"></span>
  <br><br>
  Predator or Prey:
  <input type="radio" name="predator" <?php if (isset($predator) && $predator=="predator") echo "checked";?> value="predator">Predator
  <input type="radio" name="predator" <?php if (isset($predator) && $predator=="prey") echo "checked";?> value="prey">prey
  <input type="radio" name="predator" <?php if (isset($predator) && $predator=="both") echo "checked";?> value="both">Both
  <span class="error"></span>
  <br><br>
  <input type="submit" name="submit" value="Submit">
    
    <span class="error"> <?php echo $err;?></span>
</form>

<?php
echo "<h2>Your Input:</h2>";
echo $name;
echo "<br>";
echo $class;
echo "<br>";
echo $predator;
?>

</body>
</html>
