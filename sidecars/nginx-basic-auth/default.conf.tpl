server {
    listen {{ PORT }};

    location / {
        auth_basic "Restricted";
        auth_basic_user_file "auth.htpasswd";

        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_pass "http://localhost:{{ FORWARD_PORT }}";
        proxy_read_timeout 900;
    }
}
