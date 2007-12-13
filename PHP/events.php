<?php
  // Todo: 
  // ID submission and Information
  // Event submission
  include "pws.php";
  $db = @ mysql_connect ( $db_server, $db_user, $db_passwort )
  or die ( 'Konnte keine Verbindung zur Datenbank herstellen' );
  $db_check = @ mysql_select_db ( $db_name );
  echo "<a href='events.php'>Overview</a> - <a href='?list=events'>Eventlist</a> - <a href='?list=params'>Parameterlist</a> - <a href='?list=funcs'>Functionlist</a><p>";
  if (isset($_GET["event"]))
  {
    $event = $_GET['event'];
    if (!empty($_POST["Info"]))
    {
      $sql = "UPDATE `events` SET 
              `Info`='" . $_POST["Info"] . "' WHERE Name = '$event'";
      mysql_query($sql);
    }
    $sql = "SELECT * FROM `events` WHERE Name = '$event'";
    $result = mysql_query ( $sql );
    $row = mysql_fetch_row ( $result );
    if (strlen($row[0]) > 0)
    {
      $info = $row[3];
      if (strlen($info) == 0) $info = "No information submitted";
      $msg = "Eventname: $event($row[2])<br>Function: $row[1]<br>Parameter:";
      $params = explode(",",$row[2]);
      $paraminfos = "";
      for ($x = 0;$x < count($params);$x++)
      {
        if(strlen($params[$x]) > 0)
        {
          $sql = "SELECT Info FROM `params` WHERE Name = '". $params[$x] . "'";
          $result = mysql_query ( $sql );
          $row = mysql_fetch_row ( $result );
          if (strlen($row[0]) == 0)
            $paraminfos .= "<br>" . $params[$x] . ": No information available! <a href='?param=" . $params[$x] ."'>Submit here</a>";
          else
            $paraminfos .= "<br><a href='?param=" . $params[$x] ."'>" . $params[$x] . "</a>: $row[0]";
        }
      }
      if (strlen($paraminfos) == 0) $paraminfos = " None parameter for this event";
      echo $msg . "$paraminfos<br>Information: $info";
      ?>
      <p>Submit information for this event:
      <form action="?event=<?php echo $event; ?>" method="post" enctype="multipart/form-data">
      <textarea name="Info" rows="5" cols="50"><?php echo $info; ?></textarea><br>
      <input type="submit" value="Submit" />
      </form>
      <?php 
    }
    else
      echo "The event either does not exist or isn't documented!";
  }
  elseif (isset($_GET["param"]))
  {
    $param = $_GET['param'];
    if (!empty($_POST["Info"]))
    {
      $sql2 = "UPDATE `params` SET 
              `Info`='" . $_POST["Info"] . "' WHERE Name = '$param'";
      $sql = "INSERT INTO params(Name,Info) VALUES ('$param','". $_POST["Info"] ."');";
      mysql_query($sql) or mysql_query($sql2);
    }
    $sql = "SELECT * FROM `params` WHERE Name = '$param'";
    $result = mysql_query ( $sql );
    $row = mysql_fetch_row ( $result );
    $info = $row[1];
    if (strlen($info) == 0) $info = "No information submitted";
    echo "Parametername: $param";
    echo "<br>Events: ";
    $sql = "SELECT * FROM `events` WHERE Params LIKE '%$param%'";
    $result = mysql_query($sql);
    while ($row = mysql_fetch_row ( $result ))
    {
      $msg .= "<a href='?event=$row[0]'>$row[0]</a>,";
    }
    if (strlen($msg) > 0)echo substr($msg,0,strlen($msg)-1);
    else echo "Not in use";
    echo "<br>Funcs: ";
    $msg = "";
    $sql = "SELECT * FROM `funcs` WHERE Params LIKE '%$param%'";
    $result = mysql_query($sql);
    while ($row = mysql_fetch_row ( $result ))
    {
      $msg .= "<a href='?func=$row[0]'>$row[0]</a>,";
    }
    if (strlen($msg) > 0)echo substr($msg,0,strlen($msg)-1);
    else echo "Not in use";
    echo "<br>Information: $info";
    ?>
    <p>Submit information for this parameter:
    <form action="?param=<?php echo $param; ?>" method="post" enctype="multipart/form-data">
    <textarea name="Info" rows="5" cols="50"><?php echo $info; ?></textarea><br>
    <input type="submit" value="Submit" />
    </form>
    <?php 
  }
  elseif (isset($_GET["func"]))
  {
    $func = $_GET['func'];
    if (!empty($_POST["Info"]))
    {
      $sql = "UPDATE `funcs` SET 
              `Info`='" . $_POST["Info"] . "' WHERE Name = '$func'";
      mysql_query($sql);
    }
    $sql = "SELECT * FROM `funcs` WHERE Name = '$func'";
    $result = mysql_query ( $sql );
    $row = mysql_fetch_row ( $result );
    if (strlen($row[0]) > 0)
    {
      $info = $row[1];
      if (strlen($info) == 0) $info = "No information submitted";
      $msg = "Functionname: $func($row[2])<br>Parameter:";
      $params = explode(",",$row[2]);
      $paraminfos = "";
      for ($x = 0;$x < count($params);$x++)
      {
        if(strlen($params[$x]) > 0)
        {
          $sql = "SELECT Info FROM `params` WHERE Name = '". $params[$x] . "'";
          $result = mysql_query ( $sql );
          $row = mysql_fetch_row ( $result );
          if (strlen($row[0]) == 0)
            $paraminfos .= "<br>" . $params[$x] . ": No information available! <a href='?param=" . $params[$x] ."'>Submit here</a>";
          else
            $paraminfos .= "<br><a href='?param=" . $params[$x] ."'>" . $params[$x] . "</a>: $row[0]";
        }
      }
      if (strlen($paraminfos) == 0) $paraminfos = " None parameter for this func";
      echo $msg . "$paraminfos<br>Information: $info";
      ?>
      <p>Submit information for this func:
      <form action="?func=<?php echo $func; ?>" method="post" enctype="multipart/form-data">
      <textarea name="Info" rows="5" cols="50"><?php echo $info; ?></textarea><br>
      <input type="submit" value="Submit" />
      </form>
      <?php 
    }
    else
      echo "The func either does not exist or isn't documented!";
  }
  elseif (isset($_GET["submit"]))
  {
    $submit = $_GET["text"];
    if ($_GET["submit"] == "events")
    {
      $events = explode("||",$submit);
      for ($i = 0;$i < count($events) ; $i++) 
      {
      	$eventinfo = explode("|",$events[$i]);
      	$params = "";
      	for ($x = 2;$x < count($eventinfo);$x++)
      	{
      	 $params .= $eventinfo[$x] . ",";
        }
        $params = substr($params,0,strlen($params)-1);
      	echo "$eventinfo[1]($params) in $eventinfo[0]<br>";
      	$sql = "INSERT INTO events(Name,CalledIn,Params) VALUES ('$eventinfo[1]','$eventinfo[0]','$params');";
      	$sql2 = "UPDATE `events` SET 
                  `CalledIn` = '$eventinfo[0]',
                  `Name`='$eventinfo[1]',
                  `Params`='$params' WHERE Name = '$eventinfo[1]'";
        mysql_query($sql) or mysql_query($sql2);
      }
    }
    else
    {
      $funcs = explode("||",$submit);
      for ($i = 0;$i < count($funcs) ; $i++) 
      {
      	$funcinfo = explode("|",$funcs[$i]);
      	$params = "";
      	for ($x = 1;$x < count($funcinfo);$x++)
      	{
      	 $params .= $funcinfo[$x] . ",";
        }
        $params = substr($params,0,strlen($params)-1);
      	echo "$funcinfo[1]($params) in $funcinfo[0]<br>";
      	$sql = "INSERT INTO funcs(Name,Params) VALUES ('$funcinfo[0]','$params');";
      	$sql2 = "UPDATE `funcs` SET 
                  `Name`='$funcinfo[0]',
                  `Params`='$params' WHERE Name = '$funcinfo[0]'";
        mysql_query($sql) or mysql_query($sql2);
      }
    }
  }
  elseif (isset($_GET["list"]))
  {
    echo "List of " . $_GET["list"] .":";
    $sql = "SELECT * FROM `". $_GET["list"] . "` ORDER BY Name";
    $result = mysql_query($sql);
    while ($row = mysql_fetch_row ( $result ))
    {
      $text = "$row[0]($row[2])";
      if (count($row) == 2) $text = "$row[0]";
      echo "<br><a href='?" . substr($_GET["list"],0,strlen($_GET["list"])-1) . "=$row[0]'>$text</a>";
    }
  }
  else
  {
    echo "Those <a href='?list=events'>events</a> are currently supported:<br> ";
    $sql = "SELECT * FROM `events` ORDER BY Name";
    $result = mysql_query($sql);
    while ($row = mysql_fetch_row ( $result ))
    {
      echo "<br><a href='?event=$row[0]'>$row[0]($row[2])</a>";
    }
    echo "<p>Those <a href='?list=params'>parameters</a> are currently available:<br>";
    $sql = "SELECT * FROM `params` ORDER BY Name";
    $result = mysql_query($sql);
    while ($row = mysql_fetch_row ( $result ))
    {
      echo "<br><a href='?param=$row[0]'>$row[0]</a>";
    }
    echo "<p>Those <a href='?list=funcs'>functions</a> are currently supported:<br> ";
    $sql = "SELECT * FROM `funcs` ORDER BY Name";
    $result = mysql_query($sql);
    while ($row = mysql_fetch_row ( $result ))
    {
      echo "<br><a href='?func=$row[0]'>$row[0]($row[2])</a>";
    }
  }
  
  echo '<p>This Page is supported by <br><a href="http://sourceforge.net"><img src="http://sflogo.sourceforge.net/sflogo.php?group_id=206085&amp;type=6" width="210" height="62" border="0" alt="SourceForge.net Logo" /></a>';

?>
