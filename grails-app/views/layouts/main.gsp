<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Reservation App"/></title>
		<r:require modules="jquery, bootstrap"/>
		<r:layoutResources />

%{--	start of data tables--}%
	<link rel='stylesheet' href="${resource(dir: 'css', file: 'jquery.dataTables.css')}" type="text/css"/>

	<g:javascript>
		$(document).ready(function() {
			$("#dataTablesList").dataTable();
		});
	</g:javascript>
	%{--end of data tables--}%

	<link type="text/css" href="${resource(dir: 'css', file: 'main.css')}" rel="stylesheet"/>
		<g:layoutHead/>
	</head>
	<body>
		<g:layoutBody/>
		<r:layoutResources />

		%{--for dataTables--}%
		<g:javascript library="datatables" src="jquery.dataTables.js"/>
		%{--end of dataTables--}%
	</body>
</html>
