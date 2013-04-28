<%@ page import="arkicontest_prototype.Type; arkicontest_prototype.Contest" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'contest.label', default: 'Contest')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<style>
h1.lead {
    margin-top: 50px;
}
</style>

<div class="main-banner">
    <div class="container">
        <h1 style="color:orange">Creare un contest è semplice</h1>

        <p class="lead">Inizia con il completare i primi 4 passi</p>

    </div>
</div>


<div class="container">

    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${contestInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${contestInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>


    <g:form action="save">
        <h1 class="lead">1. Dai un titolo al contest</h1>
        <hr>
        <g:textField name="title" maxlength="100" placeholder="scrivi qui il titolo del contest" required=""
                     style="font-size:30px;line-height:30px;height:35px;" class="span12"
                     value="${contestInstance?.title}"/>
        <h1 class="lead">2. Scegli il tipo di contest che desideri creare</h1>
        <hr>

        <div class="fieldcontain ${hasErrors(bean: contestInstance, field: 'type', 'error')} row weel">

            <ul class="span6 pull-left">
                <g:radioGroup name="type" values="${Type.findAll().id}" labels="${Type.findAll().id}"
                              value="${Type.findAll()[0]}">
                    <li style="display: inline-block;padding: 10px;border: 1px solid #eee; border-radius: 3px; "><img
                            src="${resource(dir: 'images', file: Type.get(it.label).icon)}"/>
                        ${it.radio}</li>
                </g:radioGroup>
            </ul>

        </div>

        <h1 class="lead">3. Fornisci una breve descrizione del contest</h1>
        <hr>


       <g:textArea name="description" maxlength="5000" rows="10" class="span12" style="
font-size: 20px;
line-height: 1.5;
font-weight: lighter;"/>

        <h1 class="lead">3. Dai una scadenza al contest <a href="#" class="pull-right">info</a></h1>
        <hr>

        <script>
            $('#dp3').datepicker()
        </script>

    <div class="input-append date" id="dp3" data-date="12-02-2012" data-date-format="dd-mm-yyyy">
        <input class="span5" name="dueDate" size="16" type="text" value="12-02-2012">
        <span class="add-on"><i class="icon-th"></i></span>
    </div>




        <fieldset>
            <button type="submit" name="create" class="btn btn-large">
                ${message(code: 'default.button.create.label', default: 'Create')}
            </button>
        </fieldset>


    </g:form>

</div>
</body>
</html>
