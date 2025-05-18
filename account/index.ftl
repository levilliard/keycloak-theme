<#import "template.ftl" as layout>
<@layout.mainLayout active='account' bodyClass='user'; section>
    <#if section = "header">
        ${msg("accountManagementTitle")}
    <#elseif section = "content">
        <script>window.location.href = "${url.accountUrl}";</script>
        <div class="card-pf">
            <div class="card-pf-body">
                <h1 style="text-align: center; color: #477f94; margin-bottom: 2rem;">Université d'État d'Haïti</h1>
                <h2>${msg("accountManagementWelcomeMessage")}</h2>
                <p>${msg("accountManagementRedirecting")}</p>
                <p><a href="${url.accountUrl}" class="btn btn-primary">${msg("openAccountConsole")}</a></p>
            </div>
        </div>
    </#if>
</@layout.mainLayout>
