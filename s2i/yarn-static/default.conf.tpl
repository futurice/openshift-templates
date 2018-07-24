server {
    listen 8080;

    location / {
        root /opt/app-root;
        {% if NGINX_NO_INDEX_FALLBACK is not defined %}
        try_files $uri /index.html;
        {% endif %}
    }
}
