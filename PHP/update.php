<?php
  include 'pws.php';
  $filelist = "download.exe;database.exe;pplayer.exe;updater.new.ppe;PlayMode.kxf;PPlayer.kxf";
  if ($_GET["filelist"] == "go")
  {
    echo $filelist . "|";
    $filelist = explode(";",$filelist);
    for ($x = 0; $x < count($filelist); $x++)
      echo date("YmdHis",filemtime("downloads/" . $filelist[$x])) . ";";
  }
  else
  {
    echo "PPlayer Filehub <p>";
    $filelist = explode(";",$filelist);
    for ($x = 0; $x < count($filelist); $x++)
      echo '<a href="http://hgsabi2009.hg.funpic.de/downloads/' . $filelist[$x] . '">' . $filelist[$x] . "</a> last updated: " . date("d.m.Y H:i:s",filemtime("downloads/" . $filelist[$x])) . "<br>";
  }
?>


