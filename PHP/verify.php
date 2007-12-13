<?php
  // Request
  
  echo '<HEAD><meta http-equiv="refresh" content="60"></HEAD>This Page is supported by <br><a href="http://sourceforge.net"><img src="http://sflogo.sourceforge.net/sflogo.php?group_id=206085&amp;type=6" width="210" height="62" border="0" alt="SourceForge.net Logo" /></a><p>';
  
  include 'pws.php';
  $ID = $_GET["ID"];
  $Code = $_GET["CODEtoVERIFY"];
  $version = $_GET["version"];
  if(empty($version)) $version = "Unknown";
  $db = @ mysql_connect ( $db_server, $db_user, $db_passwort )
        or die ( 'Konnte keine Verbindung zur Datenbank herstellen' );
  $db_check = @ mysql_select_db ( $db_name );
  If (md5($Code) == "3bbd0cbfdd01e0da8b8109fc00de2450" || $Code == "LogIn")
  {
    $sql = "SELECT ID
            FROM `Users`
            WHERE ID = '$ID'";
    $result = mysql_query($sql);
    if (mysql_num_rows($result) == 0)
    {
      $sql = "INSERT INTO `Users` (`ID`, `LastLogIn`, `Version`) 
              VALUES (
              '" . $ID . "','" . date("d.m.Y H:i:s") . "','" . $version . "'
              );";
      mysql_query($sql);
      mail("pascal.kuehne@googlemail.com","Registriert","Ein benutzer hat sich registriert: " . $ID . " am " . date("d.m.Y h:i:s"));
    }
    else
    {
      $sql = "UPDATE `Users` SET `LastLogIn` = '" . gmdate("d.m.Y h:i:s",time()+3600) . "', `Version` = '" . $version . "' WHERE `ID` = '" . $ID . "';";
      mysql_query($sql);
    }
    echo "LogIn succesfull!";   
  }
  ElseIf ($Code == "ViewLog")
  {
    $msg = "";
    $uusers = 0;
    $sql = "SELECT * FROM Users GROUP BY LastLogIn DESC";
    $result = mysql_query($sql);
    while ($row = mysql_fetch_row ( $result ))
    {
      if (strlen($row[0]) > 0)
      {
        if (file_exists("images/" . $row[0] . ".gif"))
        {
          $msg .= "ID: <img width=600 src='web.php?user=$row[0]'> logged in on " . $row[1] . " with version " . $row[2] . "<br>";
          $uusers += 1;
        }
        else
          $msg .= "ID: " . $row[0] . " logged in on " . $row[1] . " with version " . $row[2] . "<br>";
      }
    }
    $user = explode("ID",$msg);
    echo 'Log: (' . (count($user)-1) . " Registered -- " . $uusers ." Users) <p>" . $msg;
  }
  Else echo "You're not allowed to access this Page";
?>
