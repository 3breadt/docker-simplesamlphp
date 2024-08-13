<VirtualHost *:{{HTTP_PORT}}>
    ServerName localhost
    DocumentRoot /var/www/simplesamlphp
    Alias /simplesaml /var/www/simplesamlphp/www

   <Directory /var/www/simplesamlphp>
        RewriteEngine On
        RewriteBase /
        RewriteRule ^$ www [L]
        RewriteRule ^/(.+)$ www/$1 [L]
    </Directory>

    <Directory /var/www/simplesamlphp/www>
        <IfModule !mod_authz_core.c>
        Require all granted
        </IfModule>
    </Directory>
</VirtualHost>
<VirtualHost *:{{HTTPS_PORT}}>
    ServerName localhost
    DocumentRoot /var/www/simplesamlphp
    SSLEngine on
    SSLCertificateFile /var/www/simplesamlphp/cert/cert.crt
    SSLCertificateKeyFile /var/www/simplesamlphp/cert/private.key
    Alias /simplesaml /var/www/simplesamlphp/www

   <Directory /var/www/simplesamlphp>
        RewriteEngine On
        RewriteBase /
        RewriteRule ^$ www [L]
        RewriteRule ^/(.+)$ www/$1 [L]
    </Directory>
    
    <Directory /var/www/simplesamlphp/www>
        <IfModule !mod_authz_core.c>
        Require all granted
        </IfModule>
    </Directory>
</VirtualHost>

ServerName localhost
