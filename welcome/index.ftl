<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Console d'administration - UEH</title>
    <link rel="icon" href="${resourcesPath}/img/logo.png">
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${resourcesPath}/css/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
            color:rgb(12, 14, 15);
        }
        header {
            background-color: #1a2e35;
            color: white;
            padding: 1rem;
            text-align: center;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 1rem;
        }
        .card {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            padding: 2rem;
            margin-bottom: 2rem;
        }
        .logo {
            max-width: 300px;
            margin: 0 auto 2rem;
            display: block;
        }
    </style>
</head>
<body>
    <header>
        <h1>Bienvenue sur le serveur d'identité de l'Université d'État d'Haïti</h1>
    </header>
    
    <div class="container">
        <div class="card">
            <img src="https://admission.ueh.edu.ht/images/logo.png" alt="Université d'État d'Haïti" class="logo">
            <p>Ce serveur d'identité est dédié à l'Université d'État d'Haïti pour la gestion centralisée des comptes utilisateurs.</p>
            <p>Il permet aux étudiants, professeurs et au personnel administratif d'accéder aux différents services numériques de l'UEH avec un identifiant unique.</p>
            <div style="display: flex; flex-direction: column; gap: 1rem; align-items: center;">
                <a href="/auth/realms/master/protocol/openid-connect/auth?client_id=security-admin-console&response_type=code" style="display: inline-block; background-color: #477f94; color: white; padding: 12px 24px; border-radius: 4px; text-decoration: none; font-weight: bold; text-align: center; box-shadow: 0 2px 4px rgba(0,0,0,0.2); transition: all 0.3s ease; border: none; cursor: pointer; font-size: 16px; margin: 20px 0;">Se connecter</a>
                <div style="margin-top: 20px;">
                    <a href="/auth/admin/master/console" style="color: #477f94; text-decoration: underline;">Administration</a>
                    <span style="margin: 0 10px;">|</span>
                    <a href="/realms/master/account/" style="color: #477f94; text-decoration: underline;">Compte utilisateur</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
