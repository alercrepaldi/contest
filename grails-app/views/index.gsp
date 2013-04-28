<!DOCTYPE html>

<!--@TODO: tradurre in inglese le scritte in italiano -->

<%@ page import="arkicontest_prototype.Contest" %>
<%@ page import="arkicontest_prototype.ContestPartecipation" %>

<html>
<head>
    <title>Arkicontest</title>
    <meta name="layout" content="main"/>
</head>

<body>
<div class="main-banner">
    <div class="container">

        <div class="row">
            <div class="span4">
                <h1>Se hai bisogno di idee creative per</h1>
            </div>

            <div class="span4 pagination-centered" style="border:none">
                <img style="width:80%;" src="${resource(dir: 'images', file: 'arkicontest_logo.png')}"/>
            </div>

            <div class="span4" style="text-align:right;">
                <h2 style="color:orange;">architettura</h2>

                <h2 style="color:green;">green design</h2>

                <h2>interior design</h2>

                <h2 style="color:royalblue;">concepts</h2>
            </div>
        </div>


        <div class="row pagination-centered">
            <div class="row">
                <button class="span4 offset2 btn btn-large btn-info">Guarda il video</button>
                <g:link controller="contest" action="create" class="btn span4 btn-large btn-warning">Crea un contest</g:link>
            </div>
        </div>
    </div>

</div>

<div class="container" style="padding-top:20px;padding-bottom: 20px;">
    <div class="row pagination-centered" style="margin-top:20px">
        <h1>Interior and Exterior design contests</h1>
        <span class="lead">scopri come ottenere tante idee creative con un piccolo budget</span>

    </div>
</div>

<div class="instruction-bar">
    <div class="container">
        <div class="row pagination-centered">
            <div class="span3">
                <div class="image"><img src="${resource(dir: 'images/contest-flow', file: 'home-5_03.png')}"/></div>

                <div class="description lead">Cerchi idee per l'architettura o per l'intirior design?</div>
            </div>

            <div class="span3">
                <div class="image"><img src="${resource(dir: 'images/contest-flow', file: 'home-5_05.png')}"/></div>

                <div class="description lead">Crea un contest e fissa un budget</div>
            </div>

            <div class="span3">
                <div class="image"><img src="${resource(dir: 'images/contest-flow', file: 'home-5_07.png')}"/></div>

                <div class="description lead">Ricevi le proposte dai talenti della rete</div>
            </div>

            <div class="span3">
                <div class="image"><img src="${resource(dir: 'images/contest-flow', file: 'home-5_09.png')}"/></div>

                <div class="description lead">Premia il vincitore</div>
            </div>
        </div>
    </div>

</div>


<div class="main-banner">

    <div class="container">
        <div class="row" style="padding-bottom:30px;">
            <h1 class="muted">Contest attivi</h1>

        </div>


        <div class="row ">

            <g:each in="${Contest.findAll().sort { it.dateCreation }}" var="contest">

                <div class="span4 contest-box pagination-centered">

                    <div class="call4action">

                    </div>

                    <div class="contest-image">
                        <img style="height:100%;"
                             src="http://static.impossibleliving.com/media/Schermata_10-2456213_alle_16.25.17_crop_260x141.png"/>
                    </div>

                    <div>
                        <h3 class="lead">${contest.title}</h3>
                    </div>

                    <ul class="action-list">

                        <li><img src="${resource(dir: 'images', file: contest.type.icon)}"/></li>

                        <li></li>
                        <li><h3 style="line-height:30px;margin-bottom:0; padding-bottom: 0;">${Math.round(contest.reward)}</h3>
                            euro</li>
                    </ul>


                    <div class="span1 pull-right">

                    </div>

                </div>

            </g:each>
        </div>
    </div>
</div>

</body>
</html>
