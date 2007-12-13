<?php
  include 'pws.php';
  if (isset($_FILES["skin"]["name"]))
  {
    if (substr($_FILES["skin"]["name"],-3) == "kxf")
    {
      $filename = date("Ymdhis") . ".zip";
      move_uploaded_file($_FILES["skin"]["tmp_name"],"skins/" . $filename);
      echo "Please enter some information about your skin:";
      ?>
      <form action="/upload.php" method="post" enctype="multipart/form-data">
      <dl>
      <dt>Your name:</dt>
      <dd><input type="text" name="Submitter" /></dd>
      <dt>Your E-Mail:</dt>
      <dd><input type="text" name="Mail" /></dd>
      <dt>Skinname*:</dt>
      <dd><input type="text" name="Skin" /></dd>
      <dt>Comments:</dt>
      <dd><textarea name="Comments" rows="3" cols="20"></textarea></dd>
      <dt>Filename:</dt>
      <dd><input type="text" name="Filename" value="<?php echo $filename; ?>" readonly /></dd>
      </dl>
      <input type="submit" value="Senden" />
      </form>
      <?php
    }
    else
      echo "Invalid filetype.";
  }
  elseif ($_POST)
  {
    if(!empty($_POST["Skin"]))
    {
      $db = @ mysql_connect ( $db_server, $db_user, $db_passwort )
        or die ( 'Konnte keine Verbindung zur Datenbank herstellen' );
      $db_check = @ mysql_select_db ( $db_name );
      if ( $db )
      {
        if (empty($_POST["Submitter"]))
          $submitter = "Unknown Submitter";
        else
          $submitter = $_POST["Submitter"];
        if (empty($_POST["Mail"]))
          $mail = "Unknown Mail";
        else
          $mail = $_POST["Mail"];
        if (empty($_POST["Comments"]))
          $comments = "No Comments";
        else
          $comments = $_POST["Comments"];        
        $sql = "INSERT INTO skins(Submitter,Mail,Skinname,Comments,Filename,Submitted) VALUES ('" . $submitter . "','" . $mail . "','" . $_POST["Skin"] . "','" . $comments . "','" . $_POST["Filename"] . "','" . date("d.m.Y h:i:s") . "');";
        $result = mysql_query ( $sql )
                or die ("Skin already exists!");
        mail("pascal.kuehne@googlemail.com","Upload","Ein User hat eine Datei hochgeladen:
              Name: " . $submitter . "
              Mail: " . $mail . "
              Skin: " . $_POST["Skin"] . "
              Comments: " . $comments . "
              Filename: " . $_POST["Filename"] . "
              Submitted: " . date("d.m.Y h:i:s"));
        rename("skins/" . $_POST["Filename"],"skins/" . $_POST["Skin"] . ".zip");
        echo "Information saved. Thank you for submitting! <p>Fileupload finished! Please wait for an admin to verify your file.<p>";
        $sql = "INSERT skins SET Filename = " . $_POST["Skin"] . ".zip" . " WHERE Filename = " . $_POST["Filename"];
        mysql_query ( $sql );
      }
    }
    else
      echo "Please enter a Skinname!";	 
  }
  else
  {
    ?>
    You can upload your own skin to PPlayer - Portal. You may first take a look <a href = "http://www.autoitscript.com/forum/index.php?showtopic=32494&st=0&p=233849&#entry233849">here</a> for understanding how to make a skin.
    With the skinupload you upload a folder containing the Skin.dat and the 0-7.bmp. Please zip (normal zip) the folder before uploading.
    An Admin will check the skin due to compability and after accepting its released to public available on the skinstab of the settings of PPlayer.
    
    <h1>Skinupload:</h1>
    <form action="/upload.php" method="post" enctype="multipart/form-data">
    <input type="file" name="skin" />
    <input type="submit" value="Upload" />
    </form>
    <?php
    if ($_REQUEST["lol"] == "rofl")
    {
      $db = @ mysql_connect ( $db_server, $db_user, $db_passwort )
        or die ( 'Konnte keine Verbindung zur Datenbank herstellen' );
      $db_check = @ mysql_select_db ( $db_name );
      $verzen = "";
      $verz = opendir('skins');
      while ( $file = readdir ( $verz ) )
      {
        if ( $file != '.' && $file != '..' && strlen(stristr($file,".")) == 0) $verzen = $verzen . "|" . $file;
      }
      echo $verzen;
      closedir ( $verz );
      $verzense = explode("|",$verzen);
      for($x = 1;$x < count($verzense);$x++)
      {
        if (file_exists("skins/". $verzense[$x] . "/Skin.dat"))
        {
          $ini = parse_ini_file("skins/" . $verzense[$x] . "/Skin.dat");
          $sql = "INSERT INTO skins(Submitter,Mail,Skinname,Comments,Filename,Submitted,kxf) VALUES ('" . $ini["Author"] . "','" . "No Mail available" . "','" . $ini["Title"] . "','" . "Standard XSkin" . "','" . "skins/" . $verzense[$x] . "/" . "','" . date("d.m.Y h:i:s") . "','0');";
          $result = mysql_query ( $sql );
        }
      }
    }
  }
?>
