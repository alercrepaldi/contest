<!DOCTYPE html>

<%@ page import="arkicontest_prototype.Contest" %>
<%@ page import="arkicontest_prototype.ContestPartecipation" %>


<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Arkicontest</title>

	</head>
	<body>

	<g:each in="${Contest.findAll()}" var="contest">
	<div class="span5 well">
	  <h1>${contest.title} (${contest.type })</h1>
	  <h2>${contest.reward }</h2>
	  <p>${contest.dateCreation}</p>
	  <p>${contest.creator.username}</p>
	  <p>Partecipants</p>
	  <ul>
	  <g:each in="${contest.partecipations}" var="partecipation">
	  <li>${partecipation?.designer.username}</li>
	  </g:each>
	  </ul>
	</div>
	
	</g:each>
	
	</body>
</html>
