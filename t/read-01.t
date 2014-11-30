use Test::More tests => 1;
use File::Tail::Lite;

my $whole_text = <<TEXT;
2014/11/30 13:11:24 [error] 26300#0: *993233 FastCGI sent in stderr: "Unable to open primary script: /var/www/yangcong/monitor.php (No such file or directory)" while reading response header from upstream, client: 61.164.109.58, server: yangcong.me, request: "GET /monitor.php HTTP/1.1", upstream: "fastcgi://127.0.0.1:9000", host: "yangcong.me"
2014/11/30 13:11:24 [error] 26300#0: *993235 FastCGI sent in stderr: "Unable to open primary script: /var/www/yangcong/monitor.php (No such file or directory)" while reading response header from upstream, client: 140.206.173.159, server: yangcong.me, request: "GET /monitor.php HTTP/1.1", upstream: "fastcgi://127.0.0.1:9000", host: "yangcong.me"
2014/11/30 13:11:24 [error] 26300#0: *993237 FastCGI sent in stderr: "Unable to open primary script: /var/www/yangcong/monitor.php (No such file or directory)" while reading response header from upstream, client: 61.150.91.55, server: yangcong.me, request: "GET /monitor.php HTTP/1.1", upstream: "fastcgi://127.0.0.1:9000", host: "yangcong.me"
2014/11/30 13:11:24 [error] 26300#0: *993239 FastCGI sent in stderr: "Unable to open primary script: /var/www/yangcong/monitor.php (No such file or directory)" while reading response header from upstream, client: 173.230.154.150, server: yangcong.me, request: "GET /monitor.php HTTP/1.1", upstream: "fastcgi://127.0.0.1:9000", host: "yangcong.me"
2014/11/30 13:11:24 [error] 26300#0: *993241 FastCGI sent in stderr: "Unable to open primary script: /var/www/yangcong/monitor.php (No such file or directory)" while reading response header from upstream, client: 218.60.34.94, server: yangcong.me, request: "GET /monitor.php HTTP/1.1", upstream: "fastcgi://127.0.0.1:9000", host: "yangcong.me"
2014/11/30 13:11:25 [error] 26300#0: *993243 FastCGI sent in stderr: "Unable to open primary script: /var/www/yangcong/monitor.php (No such file or directory)" while reading response header from upstream, client: 174.136.4.8, server: yangcong.me, request: "GET /monitor.php HTTP/1.1", upstream: "fastcgi://127.0.0.1:9000", host: "yangcong.me"
2014/11/30 13:11:25 [error] 26300#0: *993245 FastCGI sent in stderr: "Unable to open primary script: /var/www/yangcong/monitor.php (No such file or directory)" while reading response header from upstream, client: 124.232.150.171, server: yangcong.me, request: "GET /monitor.php HTTP/1.1", upstream: "fastcgi://127.0.0.1:9000", host: "yangcong.me"
2014/11/30 13:13:24 [error] 26300#0: *993248 FastCGI sent in stderr: "Unable to open primary script: /var/www/yangcong/monitor.php (No such file or directory)" while reading response header from upstream, client: 210.200.216.145, server: yangcong.me, request: "GET /monitor.php HTTP/1.1", upstream: "fastcgi://127.0.0.1:9000", host: "yangcong.me"
140.206.173.159 - - [30/Nov/2014:13:47:32 +0000] "GET /monitor.php HTTP/1.1" 404 36 "-" "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; JianKongBao Monitor 1.1)" "-"
124.232.150.171 - - [30/Nov/2014:13:47:32 +0000] "GET /monitor.php HTTP/1.1" 404 36 "-" "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; JianKongBao Monitor 1.1)" "-"
124.133.28.7 - - [30/Nov/2014:13:47:32 +0000] "GET /monitor.php HTTP/1.1" 404 36 "-" "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; JianKongBao Monitor 1.1)" "-"
210.200.216.145 - - [30/Nov/2014:13:47:32 +0000] "GET /monitor.php HTTP/1.1" 404 36 "-" "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; JianKongBao Monitor 1.1)" "-"
173.230.154.150 - - [30/Nov/2014:13:47:32 +0000] "GET /monitor.php HTTP/1.1" 404 36 "-" "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; JianKongBao Monitor 1.1)" "-"
61.164.109.58 - - [30/Nov/2014:13:47:32 +0000] "GET /monitor.php HTTP/1.1" 404 36 "-" "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; JianKongBao Monitor 1.1)" "-"
174.136.4.8 - - [30/Nov/2014:13:47:32 +0000] "GET /monitor.php HTTP/1.1" 404 36 "-" "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; JianKongBao Monitor 1.1)" "-"
218.60.34.94 - - [30/Nov/2014:13:47:32 +0000] "GET /monitor.php HTTP/1.1" 404 36 "-" "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; JianKongBao Monitor 1.1)" "-"
114.80.201.18 - - [30/Nov/2014:13:47:33 +0000] "GET /monitor.php HTTP/1.1" 404 36 "-" "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; JianKongBao Monitor 1.1)" "-"
220.181.108.174 - - [30/Nov/2014:13:47:45 +0000] "GET / HTTP/1.1" 200 13 "-" "Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)" "-"
TEXT

my $tailf = new File::Tail::Lite(filename => "t/material/test.log", seekpos => "start");
my $text;
for(1..18)
{
	$text .= $tailf->readline();
}

is($text, $whole_text, "read file")


