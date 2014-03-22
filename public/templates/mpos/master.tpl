<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8"/>
	<title>{$GLOBAL.website.title}</title>
  <meta name="keywords" content="狗币矿池 矿池 Doge矿池 爱挖矿 狗币 DogeCoin" />
  <meta name="description" content="{$GLOBAL.website.title},中国最好的狗币矿池,专业指导，矿工停机实时通知，24小时随时提款。"/>

  <link rel="stylesheet" href="http://zeit.iwakuang.com/site_assets/mpos/css/layout.css" type="text/css" media="screen" />
  <link rel="stylesheet" href="http://zeit.iwakuang.com/site_assets/mpos/css/fontello.css">
  <link rel="stylesheet" href="http://zeit.iwakuang.com/site_assets/mpos/css/animation.css">
  <!--[if IE 7]><link rel="stylesheet" href="css/fontello-ie7.css"><![endif]-->
	<link rel="stylesheet" href="http://zeit.iwakuang.com/site_assets/mpos/css/visualize.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="http://zeit.iwakuang.com/site_assets/mpos/css/custom.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="http://zeit.iwakuang.com/site_assets/mpos/css/jquery.jqplot.min.css" type="text/css" media="screen" />
	<!--[if lt IE 9]>
	<link rel="stylesheet" href="http://zeit.iwakuang.com/site_assets/mpos/css/ie.css" type="text/css" media="screen" />
	<script src="http://zeit.iwakuang.com/site_assets/mpos/js/html5.js"></script>
	<![endif]-->
	<script type="text/javascript" src="http://zeit.iwakuang.com/site_assets/mpos/js/jquery.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="http://zeit.iwakuang.com/site_assets/mpos/js/jquery-migrate.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="http://zeit.iwakuang.com/site_assets/mpos/js/hideshow.js" type="text/javascript"></script>
  <script type="text/javascript" src="http://zeit.iwakuang.com/site_assets/mpos/js/jquery.visualize.js"></script>
  <script type="text/javascript" src="http://zeit.iwakuang.com/site_assets/mpos/js/jquery.jqplot.min.js"></script>
	<script type="text/javascript" src="http://zeit.iwakuang.com/site_assets/mpos/js/jquery.tablesorter.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="http://zeit.iwakuang.com/site_assets/mpos/js/jquery.tablesorter.pager.js" type="text/javascript"></script>
	<script type="text/javascript" src="http://zeit.iwakuang.com/site_assets/mpos/js/jquery.equalHeight.js"></script>
  <script type="text/javascript" src="http://zeit.iwakuang.com/site_assets/mpos/js/raphael-min.js"></script>
  <script type="text/javascript" src="http://zeit.iwakuang.com/site_assets/mpos/js/justgage.1.0.1.min.js"></script>
	<script type="text/javascript" src="http://zeit.iwakuang.com/site_assets/mpos/js/custom.js"></script>
  <!--[if IE]><script type="text/javascript" src="http://zeit.iwakuang.com/site_assets/mpos/js/excanvas.js"></script><![endif]-->
  
    {if $GLOBAL.statistics.analytics.enabled}
      {$GLOBAL.statistics.analytics.code}
    {/if}
    
</head>
<body>
	<header id="header">
    {include file="global/header.tpl"}
	</header>
	<section id="secondary_bar">
    {include file="global/userinfo.tpl"}
    {include file="global/breadcrumbs.tpl"}
	</section>
	<aside id="sidebar" class="column">
    {include file="global/navigation.tpl"}
	</aside>
	<section id="main" class="column">
    {if is_array($smarty.session.POPUP|default)}
      {section popup $smarty.session.POPUP}
        <h4 class="{$smarty.session.POPUP[popup].TYPE|default:"info"}">{$smarty.session.POPUP[popup].CONTENT}</h4>
      {/section}
    {/if}
    {if $CONTENT != "empty" or $CONTENT != ""}{if file_exists($smarty.current_dir|cat:"/$PAGE/$ACTION/$CONTENT")}{include file="$PAGE/$ACTION/$CONTENT"}{else}Missing template for this page{/if}{/if}
		<div class="spacer"></div>
	</section>
  <footer class="footer">
    {include file="global/footer.tpl"}
  </footer>
</body>
</html>
