<%@ page import="arkicontest_prototype.Contest" %>



<div class="fieldcontain ${hasErrors(bean: contestInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="contest.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" maxlength="100" required="" value="${contestInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contestInstance, field: 'type', 'error')} ">
	<label for="type">
		<g:message code="contest.type.label" default="Type" />
		
	</label>
	<g:select name="type" from="${contestInstance.constraints.type.inList}" value="${contestInstance?.type}" valueMessagePrefix="contest.type" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contestInstance, field: 'creator', 'error')} required">
	<label for="creator">
		<g:message code="contest.creator.label" default="Creator" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="creator" name="creator.id" from="${arkicontest_prototype.User.list()}" optionKey="id" required="" value="${contestInstance?.creator?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contestInstance, field: 'dateCreation', 'error')} required">
	<label for="dateCreation">
		<g:message code="contest.dateCreation.label" default="Date Creation" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateCreation" precision="day"  value="${contestInstance?.dateCreation}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: contestInstance, field: 'partecipations', 'error')} ">
	<label for="partecipations">
		<g:message code="contest.partecipations.label" default="Partecipations" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${contestInstance?.partecipations?}" var="p">
    <li><g:link controller="contestPartecipation" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="contestPartecipation" action="create" params="['contest.id': contestInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'contestPartecipation.label', default: 'ContestPartecipation')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: contestInstance, field: 'reward', 'error')} required">
	<label for="reward">
		<g:message code="contest.reward.label" default="Reward" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="reward" value="${fieldValue(bean: contestInstance, field: 'reward')}" required=""/>
</div>

