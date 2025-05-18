<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="refresh" content="0;url=/auth/admin/master/console">
    <title>Redirection vers la console d'administration</title>
</head>
<body>
    <p>Redirection vers la console d'administration Keycloak...</p>
    <p>Si vous n'êtes pas redirigé automatiquement, <a href="/auth/admin/master/console">cliquez ici</a>.</p>
    <script>
        // Essayer différentes URL possibles pour la console admin
        const possibleUrls = [
            '/auth/admin/master/console',
            '/admin/master/console',
            '/admin',
            '/admin/'
        ];
        
        // Fonction de redirection
        async function tryRedirect() {
            for (const url of possibleUrls) {
                try {
                    const response = await fetch(url, { method: 'HEAD' });
                    if (response.ok || response.status === 200 || response.status === 302) {
                        window.location.href = url;
                        return;
                    }
                } catch (e) {
                    console.log(`URL ${url} not accessible`);
                }
            }
            // Si aucune URL ne fonctionne, essayer la première
            window.location.href = possibleUrls[0];
        }
        
        // Exécuter la redirection
        tryRedirect();
    </script>
</body>
</html>
