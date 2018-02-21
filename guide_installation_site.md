# GUIDE INSTALLATION Bagshare.com
## Etape 1
    rajouter dans le fichier : C:/Windows/System32/drivers/etc/hosts
        127.0.0.1 localhost
        127.0.0.1 Bagshare.com
        
## Etape 2
    rajouter dans le fichier : ..(lien vers serveur)/conf/extra/http-vhosts.conf
       <VirtualHost *:80>
	          DocumentRoot "C:\wamp\www\Bagshare.com\web"
	          Servername Bagshare.com
	      <Directory "C:\wamp\www\Bagshare.com\web">
	        	AllowOverride all
	      </Directory>
       </VirtualHost>
       
       
## Etape 3
     lancer composer install
     aller sur http://bagshare.com/
