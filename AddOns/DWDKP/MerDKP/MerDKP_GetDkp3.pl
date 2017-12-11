#!/usr/bin/perl 
# $Id: MerDKP_update.pl  2006/09/20 by Mermaid $

#BAK
if (-e "dkp_list.lua") { 
	unlink("dkp_list.lua.bak");
	rename("dkp_list.lua","dkp_list.lua.bak");
}

use LWP;
use LWP::Simple;
use Encode;
#use warnings;

@pages = (
		
	{
	title		=> 'BWL',  		## *** 插件顯示的類型標題
	key 		=> '黑翼之巢', 	## *** 副本名字	
	url 		=> 'http://YourDkpHost/listmembers.php?show=all', ## *** 抓取地址
	whisper		=> 'bwldkp',		##自定義密語關鍵字
	#pagelist 	=> 1, 			##頁碼數
	#username 	=> 'user', 	##用戶名 
	#password 	=> 'pass', 	##密碼		
	#login		=> 'http://localhost/eqdkp_cn/login.php', ##登陸地址
	#webcode		=> 'gb2312', 	## 編碼 (gb2312|big5|utf8)
	#secondDKP	=> 'on', ## 啓用第2套DKP正則 (on|off)
	},	

);

#同套DKP
sub GetDKPInfo($page, $webcode) {
	$j = 0;
	undef @table;
	#正則
	$page=~s/^.+<form method=\"post\" action=\"listmembers.php\?s=[^<]+<table width=\"100%\" border=\"0\" cellspacing=\"1\" cellpadding=\"2\">//s;
	$page=~s/^.+?<tr.*?>.+?<\/tr>//s;
	while($page=~/<tr c.+?>.*?<td.*?>.+?<\/td>.*?<td.*?>.+?<\/td>.*?<td.*?><a.*?>(.+?)<\/a><\/td>.*?<td.*?>.+?<\/td>.*?<td.*?>.+?<\/td>.*?<td.*?>(.+?)<\/td>.*?<td.*?>.+?<\/td>.*?<td.*?>.+?<\/td>.*?<td.*?>.+?<\/td>.*?<td.*?>(.+?)<\/td>.*?<td.*?>.+?<\/td>.*?<\/tr>/sg) 	
	{
		($nick,$class,$value)=($1,$2,$3);
		$nick=~s/<.*?>|\n|\"|\'|&nbsp;|\s+|\t//g;
		$class=~s/<.*?>|\n|\"|\'|&nbsp;|\s+|\t//g;
		$value=~s/<.*?>|\n|\"|\'|&nbsp;|\s+|\t//g;
		#decode
		if ( @_[1] ne "utf8" )  {		
			$nick=decode("gbk", $nick);
			$class=decode("gbk", $class);
			$nick=encode("utf8", $nick);
			$class=encode("utf8", $class);
		}
		#To_utf8					
		$nick=decode("utf8", $nick);			
		$class=decode("utf8", $class);
		
		$nick = ucfirst(lc($nick));
		push @table,"{ name=\"$nick\", class=\"$class\", dkp=$value, online=1 },\n\t";
		print ++$j."..";
	}
	print F join("",@table);	
}

#不同套DKP
sub GetSecondDKPInfo($page, $webcode) {
	$j = 0;
	undef @table;
	$page=~s/^.+<form method=\"post\" action=\"listmembers.php\?s=[^<]+<table width=\"100%\" border=\"0\" cellspacing=\"1\" cellpadding=\"2\">//s;
	$page=~s/^.+?<tr.*?>.+?<\/tr>//s;
	while($page=~/<tr c.+?>.*?<td.*?>.+?<\/td>.*?<td.*?>.+?<\/td>.*?<td.*?><a.*?>(.+?)<\/a><\/td>.*?<td.*?>.+?<\/td>.*?<td.*?>.+?<\/td>.*?<td.*?>(.+?)<\/td>.*?<td.*?>.+?<\/td>.*?<td.*?>.+?<\/td>.*?<td.*?>.+?<\/td>.*?<td.*?>(.+?)<\/td>.*?<td.*?>.+?<\/td>.*?<\/tr>/sg) 
	{
		($nick,$class,$value)=($1,$2,$3);
		$nick=~s/<.*?>|\n|\"|\'|&nbsp;|\s+|\t//g;
		$class=~s/<.*?>|\n|\"|\'|&nbsp;|\s+|\t//g;
		$value=~s/<.*?>|\n|\"|\'|&nbsp;|\s+|\t//g;		
		if ( @_[1] ne "utf8" )  {		
			$nick=decode("gbk", $nick);
			$class=decode("gbk", $class);			
			$nick=encode("utf8", $nick);
			$class=encode("utf8", $class);
		}					
		$nick=decode("utf8", $nick);			
		$class=decode("utf8", $class);
		
		$nick = ucfirst(lc($nick));
		push @table,"{ name=\"$nick\", class=\"$class\", dkp=$value, online=1 },\n\t";
		print ++$j."..";
	}
	print F join("",@table);	
}

##cookie
my $response;
my $browser = LWP::UserAgent->new;
$browser->agent('Mozilla/5');
$browser->cookie_jar({}); 
#push @{$browser->requests_redirectable};

open F,">dkp_list.lua";
binmode(F,':utf8');

print F "-- <Mer_DKP> ".localtime(time).";\n\n";
print F "Mer_DKP_UPDATETIME = \"".(sprintf '%4d%02d%02d%02d%02d%02d', (localtime)[5] +1900, (localtime)[4]+1, (localtime)[3,2,1,0])."\";\n\n";
print F "MerDKP_Table = {};\n\n";

$|=1;
$i=0;
foreach $pg (@pages) {

	$title 		= ${$pg}{title};
	$key 		= ${$pg}{key};
	$whisper 	= ${$pg}{whisper} ? ${$pg}{whisper} : '';
	$username 	= ${$pg}{username};
	$password 	= ${$pg}{password};
	$pagelist 	= ${$pg}{pagelist} ? ${$pg}{pagelist} : 1;
	$url 		= ${$pg}{url};
	$login 		= ${$pg}{login};
	$webcode 	= ${$pg}{webcode} ? ${$pg}{webcode} : 'utf8';
	$secondDKP 	= ${$pg}{secondDKP} ? 'on': 'off';
	
	#decode
	$title = decode("utf8", $title);
	$key = decode("utf8", $key);
	
	#check url
	$url =~s/\.(php|asp|jsp|html|htm|aspx)$/$1\?/;
	$url =~s/([^=|\?|\&]$)/$1\&=/;
		
	print "\n\nRetriving ".(++$i).".$title \[$url\]...\n";
	
	##需要登陸
	if ($login && $password && $username) {
		##post
		$response = $browser->post( $login, [
			'username' 	=> $username,
			'password' 	=> $password,
			'login' 	=> '登入',
			],);
		#ok
		if ( $response->content )
		{				
		print F "MerDKP_Table\[$i\] = {\n\t";
		##GET
		for ( $k=1; $k<=$pagelist; $k++ ) {
			$response = $browser->get(($url.$k));
			if ( $page = $response->content ) {	
				print "\npage $k ->\n";
				($secondDKP eq 'on') ? &GetSecondDKPInfo($page, $webcode) : &GetDKPInfo($page, $webcode);
			}
		}
		}
		print F "\n};\n";
		print F "MerDKP_Table\[$i\].title = \"$title\";\n";
		print F "MerDKP_Table\[$i\].whisper = \"$whisper\";\n";
		print F "MerDKP_Table\[$i\].key = \"$key\";\n\n";
	}
	##無需登陸
	else {
		print F "MerDKP_Table\[$i\] = {\n\t";
		for ( $k=1; $k<=$pagelist; $k++ )	{			
			if ( $page = get(($url.$k)) ) {
				print "\npage $k ->\n";
				($secondDKP eq 'on') ? &GetSecondDKPInfo($page, $webcode) : &GetDKPInfo($page, $webcode);
			}
		}
		print F "\n};\n";
		print F "MerDKP_Table\[$i\].title = \"$title\";\n";
		print F "MerDKP_Table\[$i\].whisper = \"$whisper\";\n";
		print F "MerDKP_Table\[$i\].key = \"$key\";\n\n";
	}
	
}

close F;