<#import "footer.ftl" as loginFooter>
<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false>
<!DOCTYPE html>
<html class="${properties.kcHtmlClass!}" lang="${lang}"<#if realm.internationalizationEnabled> dir="${(locale.rtl)?then('rtl','ltr')}"</#if>>

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <#if properties.meta?has_content>
        <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>
    <title>${msg("loginTitle",(realm.displayName!''))}</title>
    <link rel="icon" href="${url.resourcesPath}/img/logo.png" />
    <#if properties.stylesCommon?has_content>
        <#list properties.stylesCommon?split(' ') as style>
            <link href="${url.resourcesCommonPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
        </#list>
    </#if>
    <script type="importmap">
        {
            "imports": {
                "rfc4648": "${url.resourcesCommonPath}/vendor/rfc4648/rfc4648.js"
            }
        }
    </script>
    <script src="${url.resourcesPath}/js/menu-button-links.js" type="module"></script>
    <#if scripts??>
        <#list scripts as script>
            <script src="${script}" type="text/javascript"></script>
        </#list>
    </#if>
    <script type="module">
        import { startSessionPolling } from "${url.resourcesPath}/js/authChecker.js";

        startSessionPolling(
          "${url.ssoLoginInOtherTabsUrl?no_esc}"
        );
    </script>
    <#if authenticationSession??>
        <script type="module">
            import { checkAuthSession } from "${url.resourcesPath}/js/authChecker.js";

            checkAuthSession(
                "${authenticationSession.authSessionIdHash}"
            );
        </script>
    </#if>
</head>

<body class="${properties.kcBodyClass!}" data-page-id="login-${pageId}">
    <div class="ueh-login-container">
        <!-- Left side with background image - hidden on mobile -->
        <div class="ueh-login-left"></div>
        
        <!-- Right side with login form -->
        <div class="ueh-login-right">
            <!-- Language selector -->
            <#if realm.internationalizationEnabled && locale.supported?size gt 1>
                <div class="locale-container">
                    <div id="kc-locale-wrapper" class="${properties.kcLocaleWrapperClass!}">
                        <div id="kc-locale-dropdown" class="menu-button-links ${properties.kcLocaleDropDownClass!}">
                            <button tabindex="1" id="kc-current-locale-link" aria-label="${msg("languages")}" aria-haspopup="true" aria-expanded="false" aria-controls="language-switch1">${locale.current}</button>
                            <ul role="menu" tabindex="-1" aria-labelledby="kc-current-locale-link" aria-activedescendant="" id="language-switch1" class="${properties.kcLocaleListClass!}">
                                <#assign i = 1>
                                <#list locale.supported as l>
                                    <li class="${properties.kcLocaleListItemClass!}" role="none">
                                        <a role="menuitem" id="language-${i}" class="${properties.kcLocaleItemClass!}" href="${l.url}">${l.label}</a>
                                    </li>
                                    <#assign i++>
                                </#list>
                            </ul>
                        </div>
                    </div>
                </div>
            </#if>
            
            <!-- UEH Logo -->
            <div class="ueh-logo-container">
                <img src="${url.resourcesPath}/img/logo.png" alt="Université d'État d'Haïti" />
                <p class="ueh-welcome-text">Bienvenue sur le serveur d'identité de l'UEH</p>
            </div>
            
            <!-- Main Card -->
            <div class="ueh-card">
                <!-- Page Title -->
                <div class="ueh-card-title">
                    <#if !(auth?has_content && auth.showUsername() && !auth.showResetCredentials())>
                        <#if displayRequiredFields>
                            <div>
                                <div>
                                    <span><span class="required">*</span> ${msg("requiredFields")}</span>
                                </div>
                                <div>
                                    <#nested "header">
                                </div>
                            </div>
                        <#else>
                            <#nested "header">
                        </#if>
                    <#else>
                        <#if displayRequiredFields>
                            <div>
                                <div>
                                    <span><span class="required">*</span> ${msg("requiredFields")}</span>
                                </div>
                                <div>
                                    <#nested "show-username">
                                    <div>
                                        <span>${auth.attemptedUsername}</span>
                                        <a href="${url.loginRestartFlowUrl}" aria-label="${msg("restartLoginTooltip")}">
                                            <i class="${properties.kcResetFlowIcon!}"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        <#else>
                            <#nested "show-username">
                            <div>
                                <span>${auth.attemptedUsername}</span>
                                <a href="${url.loginRestartFlowUrl}" aria-label="${msg("restartLoginTooltip")}">
                                    <i class="${properties.kcResetFlowIcon!}"></i>
                                </a>
                            </div>
                        </#if>
                    </#if>
                </div>

                <!-- Alert Messages -->
                <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
                    <div class="alert alert-${message.type}">
                        <div>
                            <#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
                            <#if message.type = 'warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
                            <#if message.type = 'error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
                            <#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
                            <span>${kcSanitize(message.summary)?no_esc}</span>
                        </div>
                    </div>
                </#if>

                <!-- Form Content -->
                <#nested "form">

                <!-- Try Another Way Link -->
                <#if auth?has_content && auth.showTryAnotherWayLink()>
                    <form id="kc-select-try-another-way-form" action="${url.loginAction}" method="post">
                        <div>
                            <input type="hidden" name="tryAnotherWay" value="on"/>
                            <a href="#" id="try-another-way"
                                onclick="document.forms['kc-select-try-another-way-form'].requestSubmit();return false;">${msg("doTryAnotherWay")}</a>
                        </div>
                    </form>
                </#if>

                <!-- Social Providers -->
                <#nested "socialProviders">

                <!-- Additional Info (like registration link) -->
                <#if displayInfo>
                    <div id="kc-info">
                        <div>
                            <#nested "info">
                        </div>
                    </div>
                </#if>
            </div>
            
            <!-- Footer -->
            <@loginFooter.content/>
        </div>
    </div>
</body>
</html>
</#macro>
