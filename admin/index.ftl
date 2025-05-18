<#import "template.ftl" as layout>
<@layout.mainLayout active='account' bodyClass='admin'; section>
    <div id="sidenavcontainer">
        <nav id="sidenav" role="navigation" aria-labelledby="sidenav-label" class="${properties.kcSideNavClass!} list-unstyled">
            <button class="btn btn-menu dropdown" type="button" data-toggle="collapse" id="sidenav-label">
                Admin Console<span id="sidenav-icon" class="fa fa-angle-down"></span>
            </button>
            <h6 class="nav-header">
                <span class="text">System</span>
            </h6>
            <li>
                <ul class="menu-item-container">
                    <li><a href="${adminBaseUrl}#/realms/master">Master</a></li>
                </ul>
            </li>
        </nav>
    </div>
    <div id="view" class="view-container">
        <h1>Université d'État d'Haïti - Console d'administration</h1>
        <p>Bienvenue sur la console d'administration de Keycloak.</p>
        <p>Cette page est affichée en utilisant le thème UEH.</p>
    </div>
</@layout.mainLayout>
