import com.sun.net.httpserver.HttpExchange;
import com.sun.net.httpserver.HttpHandler;
import com.sun.net.httpserver.HttpServer;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.nio.file.Files;
import java.nio.file.Paths;

public class SimpleWebServer {
    public static void main(String[] args) throws Exception {
        // Créer le serveur HTTP sur le port 8000
        HttpServer server = HttpServer.create(new InetSocketAddress(8000), 0);
        
        // Configurer le gestionnaire pour la racine
        server.createContext("/", new RootHandler());
        
        // Démarrer le serveur
        server.setExecutor(null);
        server.start();
        System.out.println("Le serveur d'accueil UEH a démarré sur le port 8000");
    }
    
    static class RootHandler implements HttpHandler {
        @Override
        public void handle(HttpExchange exchange) throws IOException {
            // Chemin du fichier HTML statique
            String htmlPath = "/opt/keycloak/welcome-page.html";
            File htmlFile = new File(htmlPath);
            
            if (htmlFile.exists()) {
                // Lire le contenu du fichier
                byte[] fileData = Files.readAllBytes(Paths.get(htmlPath));
                
                // Définir les en-têtes de réponse
                exchange.getResponseHeaders().set("Content-Type", "text/html; charset=UTF-8");
                exchange.sendResponseHeaders(200, fileData.length);
                
                // Envoyer le contenu du fichier
                try (OutputStream os = exchange.getResponseBody()) {
                    os.write(fileData);
                }
            } else {
                // Si le fichier n'existe pas, rediriger vers Keycloak
                exchange.getResponseHeaders().set("Location", "http://localhost:8080");
                exchange.sendResponseHeaders(302, -1);
                exchange.close();
            }
        }
    }
}
