<?php
  include 'pws.php';
  $db = @ mysql_connect ( $db_server, $db_user, $db_passwort )
    or die ( 'Konnte keine Verbindung zur Datenbank herstellen' );
  $db_check = @ mysql_select_db ( $db_name );
  if (!empty($_GET["plugin"]))
  {
    if (!empty($_GET["rating"]))
    {
      if ($_GET["rating"] > 5) die ("Invalid rating!");
    	$sql = "UPDATE `plugins` SET `Rating` = (`Rating`+". $_GET["rating"].")/2 WHERE Name = '" . $_GET['plugin'] . "'";
      mysql_query($sql);
      die ();
    }
    $sql = "SELECT * FROM `plugins` WHERE Name = '" . $_GET['plugin'] . "'";
    $result = mysql_query ( $sql );
    while ( $row = mysql_fetch_row ( $result ) )
    {
      echo $row[3];
    }
  }
  elseif ($_GET["show"] == "upload")
  {
    ?>
    <h1>Pluginupload:</h1>
    <form action="plugin.php?show=uploaded" method="post" enctype="multipart/form-data">
    <input type="file" name="plugin" />
    <input type="submit" value="Upload" />
    </form>
    <?php
  }
  elseif ($_GET["show"] == "uploaded")
  {
    if (substr($_FILES["plugin"]["name"],-3) == "au3")
    {
      move_uploaded_file($_FILES["plugin"]["tmp_name"],"plugintemp/" . $_FILES["plugin"]["name"]);
      echo "Please enter some information about your plugin:";
      ?>
      <form action="plugin.php" method="post" enctype="multipart/form-data">
      <dl>
      <dt>Your name:</dt>
      <dd><input type="text" name="Author" /></dd>
      <dt>Your E-Mail:</dt>
      <dd><input type="text" name="Mail" /></dd>
      <dt>Pluginname*:</dt>
      <dd><input type="text" name="Plugin" /></dd>
      <dt>Version:</dt>
      <dd><input type="text" name="Version" /></dd>
      <dt>Quick Description*:</dt>
      <dd><input type="text" name="QD" /></dd>
      <dt>Long Description:</dt>
      <dd><textarea name="LD" rows="3" cols="20"></textarea></dd>
      </dl>
      <input type="submit" value="Submit" />
      </form>
      <?php
    }
    else
      echo "Invalid filetype.";
  }
  elseif ($_POST)
  {
    if(!empty($_POST["Plugin"]) || !empty($_POST["QD"]))
    {
      $db = @ mysql_connect ( $db_server, $db_user, $db_passwort )
        or die ( 'Konnte keine Verbindung zur Datenbank herstellen' );
      $db_check = @ mysql_select_db ( $db_name );
      if ( $db )
      {
        if (empty($_POST["Author"]))
          $submitter = "Unknown Author";
        else
          $submitter = $_POST["Author"];
        if (empty($_POST["Mail"]))
          $mail = "Unknown Mail";
        else
          $mail = $_POST["Mail"];
        if (empty($_POST["LD"]))
          $LD = $_POST["QD"];
        else
          $LD = $_POST["LD"];
        if (empty($_POST["Version"]))
          $Version = "0.1";
        else
          $Version = "0.1";
          
        $sql = "INSERT INTO plugins(Author,Mail,Name,QD,Date,LD,Version) VALUES ('" . $submitter . "','" . $mail . "','" . $_POST["Plugin"] . "','" . $QD . "','" . date("Y-m-d h:i:s") . "','" . $LD . "','" . $Version . "');";
        $result = mysql_query ( $sql )
                or die ("Plugin already exists!");
        /*
        mail("pascal.kuehne@googlemail.com","Upload","Ein User hat eine Datei hochgeladen:
              Name: " . $submitter . "
              Mail: " . $mail . "
              Plugin: " . $_POST["Plugin"] . "
              QD: " . $QD . "
              Filename: " . $_POST["Filename"] . "
              Submitted: " . date("d.m.Y h:i:s"));
        */
        // rename("plugins/" . $_POST["Filename"],"plugins/" . $_POST["Plugin"] . ".zip");
        echo "Information saved. Thank you for submitting! <p>Fileupload finished! Please wait for an admin to verify your file.<p>";
        //$sql = "INSERT plugins SET Filename = " . $_POST["Plugin"] . ".zip" . " WHERE Filename = " . $_POST["Filename"];
        //mysql_query ( $sql );
      }
    }
    else
      echo "Please enter a Pluginname and a Quick description!";	 
  }
  else
  {
    $sql = 'SELECT * FROM `plugins` ORDER BY (Rating) DESC,Name';
    $result = mysql_query ( $sql );
    while ( $row = mysql_fetch_row ( $result ) )
    {
      echo "$row[0]|$row[1]|$row[2]|$row[4]|$row[5]||";
    }
  }
  echo '<info><p>This Page is supported by <br><a href="http://sourceforge.net"><img src="http://sflogo.sourceforge.net/sflogo.php?group_id=206085&amp;type=6" width="210" height="62" border="0" alt="SourceForge.net Logo" /></a><p>';

?>
