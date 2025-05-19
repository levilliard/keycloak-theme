<#import "template.ftl" as layout>
<@layout.mainLayout active="console" bodyClass="admin-console"; section>
    <#if section = "header">
        ${msg("consoleTitle")}
    <#elseif section = "content">
        <div id="welcomeScreen" class="pf-c-page">
            <main class="pf-c-page__main" tabindex="-1">
                <section class="pf-c-page__main-section pf-m-light">
                    <div class="pf-c-content">
                        <h1>${msg("consoleTitle")}</h1>
                        <p>${msg("adminConsoleHelp")}</p>
                    </div>
                </section>
            </main>
        </div>
    </#if>
</@layout.mainLayout>
