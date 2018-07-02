server {
    listen {{ PORT }};

    location / {

        # Basic Auth
        limit_except OPTIONS {
            auth_basic "Restricted";
            auth_basic_user_file "auth.htpasswd";
        }

        {% if CORS_ORIGIN is defined %}
        # CORS Preflight Request
        if ($request_method = 'OPTIONS') {
            add_header 'Access-Control-Allow-Origin' '{{ CORS_ORIGIN }}';
            add_header 'Access-Control-Allow-Methods' 'GET, POST, OPTIONS';
            add_header 'Access-Control-Allow-Headers' 'Content-Type,Authorization';
            add_header 'Access-Control-Max-Age' 1728000;
            add_header 'Content-Type' 'text/plain; charset=utf-8';
            add_header 'Content-Length' 0;
            return 204;
        }

        # CORS Headers
        if ($request_method ~ 'GET|POST') {
            add_header 'Access-Control-Allow-Origin' '{{ CORS_ORIGIN }}' always;
            add_header 'Access-Control-Allow-Methods' 'GET, POST, OPTIONS' always;
            add_header 'Access-Control-Allow-Headers' 'Content-Type,Authorization' always;
            add_header 'Access-Control-Expose-Headers' 'Content-Length,Content-Range' always;
        }
        {% endif %}

        # Proxy
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_pass "http://localhost:{{ FORWARD_PORT }}";
        proxy_read_timeout 900;
    }
}
