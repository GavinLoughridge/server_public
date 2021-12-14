server {
    listen 80;
    listen [::]:80;
    server_name gavinloughridge.com www.gavinloughridge.com;
    return 302 https://gavin.id;
}

server {
    listen 443 ssl http2;
    listen [::]:443 ssl http2;
    include snippets/self-signed.conf;
    include snippets/ssl-params.conf;

    server_name gavinloughridge.com www.gavinloughridge.com;
    return 302 https://gavin.id;
}
