<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title><g:layoutTitle default="Grails" /></title>

<link rel="shortcut icon"
	href="${resource(dir: 'images', file: 'favicon.ico')}"
	type="image/x-icon">
<link rel="apple-touch-icon"
	href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
<link rel="apple-touch-icon" sizes="114x114"
	href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">


<link rel="stylesheet/less" type="text/css"
	href="${resource(dir: 'less', file: 'bootstrap.less')}" />

<!--<link rel="stylesheet/less" type="text/css"
	href="${resource(dir: 'less/custom', file: 'index.less')}" />-->


<script type="text/javascript">
    less = {
        env: "development", // or "production"
        async: false,       // load imports async
        fileAsync: false,   // load imports async when in a page under
                            // a file protocol
        poll: 1000,         // when in watch mode, time in ms between polls
        functions: {},      // user functions, keyed by name
        dumpLineNumbers: "comments", // or "mediaQuery" or "all"
        relativeUrls: false,// whether to adjust url's to be relative
                            // if false, url's are already relative to the
                            // entry less file
        rootpath: ":/a.com/"// a path to add on to the start of every url
                            //resource
    };
</script>

<r:require modules="less-compiler" />
<g:layoutHead />
<r:layoutResources />
</head>
<body>
	<g:render template="/layouts/navigation" />


		<g:layoutBody />


		<g:javascript library="application" />
		<r:layoutResources />
       
</body>
</html>
