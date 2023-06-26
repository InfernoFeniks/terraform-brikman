#!/bin/bash

cat > index.html <<EOF
<h1>Hello, World</h1>
<p>DB address: ${db_address}</p>
<p>DB port: ${db_port}</p>
<p>------------</p>
EOF

cat /etc/hostname >> index.html

nohup busybox httpd -f -p ${server_port} &