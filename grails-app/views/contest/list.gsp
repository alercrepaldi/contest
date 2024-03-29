<%@ page import="arkicontest_prototype.Contest" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'contest.label', default: 'Contest')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-contest" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                              default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-contest" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="title" title="${message(code: 'contest.title.label', default: 'Title')}"/>

            <g:sortableColumn property="type" title="${message(code: 'contest.type.label', default: 'Type')}"/>

            <th><g:message code="contest.creator.label" default="Creator"/></th>

            <g:sortableColumn property="dateCreation"
                              title="${message(code: 'contest.dateCreation.label', default: 'Date Creation')}"/>

            <g:sortableColumn property="reward" title="${message(code: 'contest.reward.label', default: 'Reward')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${contestInstanceList}" status="i" var="contestInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${contestInstance.id}">${fieldValue(bean: contestInstance, field: "title")}</g:link></td>

                <td>${fieldValue(bean: contestInstance, field: "type")}</td>

                <td>${fieldValue(bean: contestInstance, field: "creator")}</td>

                <td><g:formatDate date="${contestInstance.dateCreation}"/></td>

                <td>${fieldValue(bean: contestInstance, field: "reward")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${contestInstanceTotal}"/>
    </div>
</div>
</body>
</html>
