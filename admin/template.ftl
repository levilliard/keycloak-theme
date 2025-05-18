<#macro mainLayout active bodyClass>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Console d'administration - UEH</title>
    <link rel="icon" href="../login/resources/img/logo.png">
    <link href="../login/resources/css/ueh-theme.css" rel="stylesheet" />
</head>
<body class="admin-console user ${bodyClass}">
    <header class="navbar navbar-default navbar-pf navbar-main header">
        <div class="navbar-title">
            <h1>UEH - Keycloak Admin Console</h1>
        </div>
    </header>
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-10 col-md-12 col-lg-12 content-area">
                <#nested "content">
            </div>
        </div>
    </div>
</body>
</html>
</#macro>
