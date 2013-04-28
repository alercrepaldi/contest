<%@ page import="arkicontest_prototype.Contest" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'contest.label', default: 'Contest')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-contest" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                              default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-contest" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list contest">

        <g:if test="${contestInstance?.title}">
            <li class="fieldcontain">
                <span id="title-label" class="property-label"><g:message code="contest.title.label"
                                                                         default="Title"/></span>

                <span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${contestInstance}"
                                                                                         field="title"/></span>

            </li>
        </g:if>

        <g:if test="${contestInstance?.type}">
            <li class="fieldcontain">
                <span id="type-label" class="property-label"><g:message code="contest.type.label"
                                                                        default="Type"/></span>

                <span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${contestInstance}"
                                                                                        field="type"/></span>

            </li>
        </g:if>

        <g:if test="${contestInstance?.creator}">
            <li class="fieldcontain">
                <span id="creator-label" class="property-label"><g:message code="contest.creator.label"
                                                                           default="Creator"/></span>

                <span class="property-value" aria-labelledby="creator-label"><g:link controller="user" action="show"
                                                                                     id="${contestInstance?.creator?.id}">${contestInstance?.creator?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${contestInstance?.dateCreation}">
            <li class="fieldcontain">
                <span id="dateCreation-label" class="property-label"><g:message code="contest.dateCreation.label"
                                                                                default="Date Creation"/></span>

                <span class="property-value" aria-labelledby="dateCreation-label"><g:formatDate
                        date="${contestInstance?.dateCreation}"/></span>

            </li>
        </g:if>

        <g:if test="${contestInstance?.partecipations}">
            <li class="fieldcontain">
                <span id="partecipations-label" class="property-label"><g:message code="contest.partecipations.label"
                                                                                  default="Partecipations"/></span>

                <g:each in="${contestInstance.partecipations}" var="p">
                    <span class="property-value" aria-labelledby="partecipations-label"><g:link
                            controller="contestPartecipation" action="show"
                            id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

        <g:if test="${contestInstance?.reward}">
            <li class="fieldcontain">
                <span id="reward-label" class="property-label"><g:message code="contest.reward.label"
                                                                          default="Reward"/></span>

                <span class="property-value" aria-labelledby="reward-label"><g:fieldValue bean="${contestInstance}"
                                                                                          field="reward"/></span>

            </li>
        </g:if>

    </ol>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${contestInstance?.id}"/>
            <g:link class="edit" action="edit" id="${contestInstance?.id}"><g:message code="default.button.edit.label"
                                                                                      default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
