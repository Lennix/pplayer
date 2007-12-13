<?PHP
include 'pws.php';
    $db = @ mysql_connect ( $db_server, $db_user, $db_passwort )
      or die ( 'Konnte keine Verbindung zur Datenbank herstellen' );
    $db_check = @ mysql_select_db ( $db_name );
//
$tcolor = explode(".",$_GET["tc"]);
$bcolor = explode(".",$_GET["bc"]);
$user = $_GET["user"];

$username = $_GET["username"];
$topArtist = $_GET["TopArtist"];
$topArtistTime = $_GET["TopArtistTime"];
$topAlbum = $_GET["TopAlbum"];
$topAlbumTime = $_GET["TopAlbumTime"];
$topTrack = $_GET["TopTrack"];
$topTrackTime = $_GET["TopTrackTime"];
$LastUpdate = date("YmdHis");
$Status = $_GET["Status"];

if (!empty($user))
{
  if (!empty($username))
  {
    $sql = "UPDATE `Users` SET 
    `User` = '$username',
    `ArtistTime`='$topArtistTime',
    `AlbumTime`='$topAlbumTime',
    `Status` = '$Status',
    `LastUpdated` = '$LastUpdate',
    `Artist` = '$topArtist',
    `Album` = '$topAlbum',
    `Track` = '$topTrack',
    `TrackTime`='$topTrackTime' WHERE ID = '$user'";
    mysql_query($sql);
  	echo 'This Page is supported by <br><a href="http://sourceforge.net"><img src="http://sflogo.sourceforge.net/sflogo.php?group_id=206085&amp;type=6" width="210" height="62" border="0" alt="SourceForge.net Logo" /></a><p>';
  }
  else
  {
    $sql = "SELECT * FROM `Users` WHERE ID = '$user'";
    $result = mysql_query ( $sql );
    $row = mysql_fetch_row ( $result );
    header ( 'Content-Type: image/gif' );
    $text = "PPlayer Songview (Alpha) - PPlayer V$row[2] - http://www.pplayer.net.ms|$row[3] - $row[4]|||PPlayer - Statistic|Top Artist: $row[6] @ $row[9] min|Top Album: $row[7] @ $row[10] min|Top Track: $row[8] @ $row[11] min";
    $text = explode("||",$text);
    $text1 = explode("|",$text[0]);
    $text2 = explode("|",$text[1]);
    
    $toplen1 = 0;
    $toplen2 = 0;
    
    for ($x = 1; $x < count($text1) ; $x++ ) 
    {
      if (strlen($text1[$x]) > $toplen1) $toplen1 = strlen($text1[$x]);
    }
    for ($x = 0; $x < count($text2) ; $x++ ) 
    {
      if (strlen($text2[$x]) > $toplen2) $toplen2 = strlen($text2[$x]);
    }
    $font = 5;
    $toplen1 *= 1.9*$font;
    $toplen2 *= 1.9*$font;
    $width = $toplen1 + $toplen2;
    if ($width < 760) $width = 760;
    $heigth = count($text2)*16;
    $image = imagecreate ($width +1,$heigth+1);
    if (count($bcolor) == 3)
    {
      $farbe_body = imagecolorallocate ( $image, $bcolor[0], $bcolor[1], $bcolor[2] );
      $farbe_b = imagecolorallocate ( $image, $tcolor[0], $tcolor[1], $tcolor[2] );
    }
    else
    {
      $farbe_body = imagecolorallocate ( $image, 255, 255, 255 );
      $farbe_b = imagecolorallocate ( $image, 0, 0, 0 );
    }
    
    imageline($image,$toplen1-5,15,$toplen1-5,count($text2)*16,$farbe_b);
    
    imageline($image,0,0,$width,0,$farbe_b);
    imageline($image,0,0,0,$heigth,$farbe_b);
    
    imageline($image,0,$heigth,$width,$heigth,$farbe_b);
    
    imageline($image,$width,0,$width,$heigth,$farbe_b);
    imageline($image,0,15,$width,15,$farbe_b);
  
    for ($x = 0; $x < count($text1) ; $x++ ) 
    {
      if (strlen($text1[$x]) > $toplen) $toplength = strlen($text[$x]);
    	imagestring ( $image, $font,5,15*($x), $text1[$x], $farbe_b );
    }
    for ($x = 0; $x < count($text2) ; $x++)
    {
      imagestring ( $image, $font,$toplen1,15*($x), $text2[$x], $farbe_b );
    }
    
    $insert = imagecreatefrompng("http://sflogo.sourceforge.net/sflogo.php?group_id=206085&amp;type=1");
    $farbe_b = imagecolorallocate($insert, 255, 255, 255);
    imagecolortransparent ($insert ,$farbe_b );
    imagecopy($image,$insert,$width-imagesx($insert)-1,1,0,9,imagesx($insert),imagesy($insert)-19);
    imagegif ( $image);// , 'images/' . $user . '.jpg'); 
  }
}
else
{
  include 'pws.php';
  echo "This page may only be viewed with a valid URL.";
}
?> 

