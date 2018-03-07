<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>jQueryでlightbox風の画像表示を自作する</title>
<style type="text/css">
 @import "http://www.finefinefine.jp/wp/wp-content/themes/mystique/style.css";
 @import "http://www.finefinefine.jp/date/2010/10/?mystique=css";
#header-wrapper {
  height: 60px;
}
#header {
  height: 60px;
}
#site-title {
  padding: 10px 0 0 0;
}
h5 {
  margin-top: 20px;
}
#main {
  clear: left;
  margin: 20px auto;
  padding: 5px 20px;
  width: 800px;
}
h3 {
  font-size: 20px;
}
#button {
  margin: 50px auto 20px auto;
  width: 200px;
  padding: 10px;
  border: solid 2px #ccc;
  background: #eee;
  text-align: center;
  font-weight: bold;
  cursor: pointer;
}
#sample {
  margin: 10px auto 400px auto;
  width: 800px;
  padding: 20px;
  border: solid 1px #ccc;
}
#sample ul:after {
  content: ".";
  display: block;
  visibility: hidden;
  height: 0.1px;
  font-size: 0.1em;
  line-height: 0;
  clear: both;
}
#sample li {
  float: left;
}
#sample li img {
  cursor: pointer;
  width: 155px;
}
.overlay {
  position: absolute;
  display: none;
  top: 0;
  width: 100%;
  z-index: 1;
  background: url(images/black.png);
}
.overlay img {
  display: inline-block;
  position: absolute;
  width: 800px;
  -webkit-box-shadow: 0px 0px 20px 0px #333;
  -moz-box-shadow: 0px 0px 20px 0px #333;
  box-shadow: 0px 0px 20px 0px #333;
}
#cursol {
  position: absolute;
  padding: 5px;
  color: #fff;
  background: #666;
  -moz-border-radius: 3px;
  -webkit-border-radius: 3px;
  border-radius: 3px;
  -webkit-box-shadow: 2px 2px 5px 0px #333;
  -moz-box-shadow: 2px 2px 5px 0px #333;
  box-shadow: 2px 2px 5px 0px #333;
}
</style>
<script type="text/javascript" src="http://www.google.com/jsapi"></script>
<script type="text/javascript">google.load("jquery", "1.4");</script>
<script type="text/javascript">
$(function() {
	$("body").prepend('<div class="overlay"></div>');
	var h = $(document).height();
	$(".overlay").css('height', h);
	$("#sample li img").click(function() {
		var url = $(this).attr('src');
		var w = ($(document).width()/2)-400;
		var t = $(document).scrollTop()+100;
		$(".overlay").empty().append('<img src="' + url + '" /><span id="cursol">画面クリックで閉じる</span>').fadeIn('fast');
		$(".overlay img").css({left: w, top: t, opacity: '1'});
		$("body").mousemove(function(e) {
			var x = e.pageX + 10;
			var y = e.pageY - 30;
			$("#cursol").css({top: y, left: x});
		});
	});
	$(".overlay").click(function() {
		$(".overlay").hide();
	});
});
</script>
</head>

<body class="archive date col-2-right fixed loggedin browser-chrome">

<div id="page">

<div class="page-content header-wrapper">

<div id="header">

<div id="site-title" class="clear-block">
<div id="logo"><a href="http://www.finefinefine.jp"><img src="http://www.finefinefine.jp/wp/wp-content/uploads/F3.png" title="fine×3 |  jQueryのサンプルやtipsの紹介
" alt="fine×3 | jQueryやらhtml5,cssとか" /></a></div>        <p class="headline"> jQueryのサンプルやtipsの紹介
</p>
</div><!--site-title-->

</div><!--header-->

</div><!--page-content-->

<div id="main">

<h5>jQueryでlightbox風の画像表示を自作する</h5>
<div id="sample">
<ul>
<li><img src="/Seasar_Tags/images/pic1.jpg" /></li>
<li><img src="/Seasar_Tags/images/pic2.jpg" /></li>
<li><img src="/Seasar_Tags/images/pic3.jpg" /></li>
<li><img src="/Seasar_Tags/images/pic5.jpg" /></li>
<li><img src="/Seasar_Tags/images/pic6.jpg" /></li>
<li><img src="/Seasar_Tags/images/pic7.jpg" /></li>
<li><img src="/Seasar_Tags/images/pic8.jpg" /></li>
<li><img src="/Seasar_Tags/images/pic9.jpg" /></li>
</ul>
</div>

</div><!--main-->

</div><!--page-->

</body>
</html>
