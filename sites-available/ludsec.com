server {
    listen 80;
    listen [::]:80;
    server_name ludsec.com www.ludsec.com;
    return 302 https://ludsec.com$request_uri;
}

server {
        listen 443 ssl http2;
        listen [::]:443 ssl http2;
        include snippets/self-signed.conf;
        include snippets/ssl-params.conf;

        root /var/www/ludsec.com/html;
        index index.html;

        server_name ludsec.com www.ludsec.com;

        location / {
                try_files $uri $uri/ =404;
        }
}
