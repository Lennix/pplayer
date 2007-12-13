<?php
  include 'pws.php';
  $db = @ mysql_connect ( $db_server, $db_user, $db_passwort )
    or die ( 'Konnte keine Verbindung zur Datenbank herstellen' );
  $db_check = @ mysql_select_db ( $db_name );
  if (empty($_GET["skin"]))
  {
    $sql = 'SELECT Skinname FROM `skins` WHERE kxf = 0 ORDER BY (Views+Selected*10+Rating*(Selected*2)) DESC,Skinname';
    $result = mysql_query ( $sql );
    while ( $row = mysql_fetch_row ( $result ) )
    {
      echo $row[0] . "|";
    }
  }
  else
  {
    if (!empty($_GET["rating"]))
    {
      if ($_GET["rating"] > 5) die ("Invalid rating!");
    	$sql = "UPDATE `skins` SET `Rating` = (`Rating`+". $_GET["rating"].")/2 WHERE Skinname = '" . $_GET['skin'] . "'";
      mysql_query($sql);
      echo '<info><p>This Page is supported by <br><a href="http://sourceforge.net"><img src="http://sflogo.sourceforge.net/sflogo.php?group_id=206085&amp;type=6" width="210" height="62" border="0" alt="SourceForge.net Logo" /></a><p>';
      die ();
    }
    if (!empty($_GET["select"]))
    {
      $sql = "UPDATE `skins` SET `Selected` = `Selected`+1 WHERE Skinname = '" . $_GET['skin'] . "'";
      mysql_query($sql);
    }
    if (!empty($_GET["show"]))
    {
      $sql = "UPDATE `skins` SET `Views` = `Views`+1 WHERE Skinname = '" . $_GET['skin'] . "'";
      mysql_query($sql);
    }
    $sql = "SELECT * FROM `skins` WHERE Skinname = '" . $_GET['skin'] . "'";
    $result = mysql_query ( $sql );
    while ( $row = mysql_fetch_row ( $result ) )
    {
      echo "Skinname:<tab>$row[2]<br>Author:<tab><tab>$row[0] <br>Mail:<tab><tab>$row[1]<br>Submitted:<tab>$row[5]<br>Views:<tab><tab>$row[7]<br>Selected:<tab>$row[8]<br>Rating:<tab><tab>$row[9]<br>Comments:<tab>$row[3]";
    }
  }
  echo '<info><p>This Page is supported by <br><a href="http://sourceforge.net"><img src="http://sflogo.sourceforge.net/sflogo.php?group_id=206085&amp;type=6" width="210" height="62" border="0" alt="SourceForge.net Logo" /></a><p>';

?>
