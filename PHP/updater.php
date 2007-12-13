<?php
  if($_GET["show"] == "news")
  {
    echo '<body bgcolor=#'. $_GET["bg"].' text=#'.$_GET["tc"].'><h1>Update News</h1>';
    echo "<p>
          0.9.4: (Its recommended to reinstall PPlayer due to some minor changes)
          <br>
          <ul>
          <li><b>PlayList enhancement</b>:
          <br>The playlist got a big enhancement. It's now possible to Drag'n'Drop songs. The playlist is now much faster, but has to be tested: Itself its in beta.</li>
          <li><b>New icons</b>:
          <br>The old iconset contains now every icon requiered (No buttons on GUI left) and a new iconset has been added and made default. Thanks i542 for the nice icons!<li>
          <li><b>Stream-Plugin</b>:
          <br>The new version introduces the Stream-Plugin making PPlayer able to listen to Net-Streams (Net-Radios).
          <li><b>Bugfixes</b>:
          <br>Some minor bugs got fixed in this version. The most significant bugfix is the remove of the crash on exit. Wherefore the debugger was disabled and the updater now longer has the IE-Obj until the error isn't fixed.
          <br>I also try to fix the fileassociation, but its actually not fully featured in the version. (But it should run)</li>
          <li><b>Other changes</b>:
          <br>The statusbar is now defaultly disabled but you can enable it in the settings.</li>
          </ul>
          <p>
          0.9.3 beta:
          <br>
          <ul>
          <li><b>Updater-Plugin</b>:
          <br>The Updater-Plugin now also updates plugins. This is one step on the way to 0.9.5 (Plugin-Update).</li>
          </ul>
          <p>
          0.9.2.5 beta:
          <br>
          <ul>
          <li><b>Updater-Plugin</b>:
          <br>The new plugin replaces the old autoupdater of PPlayer. It works with more files and can be disabled in the settings.</li>
          <li><b>Bugfixes</b>:
          <br>Some bugs crashing PPlayer are now fixed. One bug is still crashing PPlayer while closing. I'm currently working on a fix.
          </ul>";
  }
  elseif($_GET["show"] == "filelist")
  {
    $filelist = "pplayer.au3;";
    $filelist .= "resource/download.exe;resource/database.exe;resource/DefaultPlayMode.kxf;resource/LargePPlayer.kxf;resource/DefaultPPlayer.kxf;resource/Defaulticos.dll;";
    $filelist .= "include/ListView.au3;include/WMP.au3;include/XSkin.au3;Plugins/Plugins.au3;Plugins/Stream/Main.au3";
    $filelist = explode(";",$filelist);
    for ($x = 0; $x < count($filelist); $x++)
      echo str_replace("/","\\",$filelist[$x]) .";".gmdate("YmdHis",filemtime("downloads/" . $filelist[$x])+3600) . "|";
  }
  elseif($_GET["show"] == "filetime")
  {
    echo gmdate("YmdHis",filemtime("downloads/" . $_GET["file"])+3600);
  }
  echo '<pexit><p>This Page is supported by <br><a href="http://sourceforge.net"><img src="http://sflogo.sourceforge.net/sflogo.php?group_id=206085&amp;type=6" width="210" height="62" border="0" alt="SourceForge.net Logo" /></a><p>';
?>

