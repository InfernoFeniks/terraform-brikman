#!/bin/bash

cat > index.html <<EOF
<h1>${server_text} (version 2)</h1>
<p>------------</p>
<p>DB address: ${db_address}</p>
<p>------------</p>
<p>DB port: ${db_port}</p>
<p>------------</p>
EOF

cat /etc/hostname >> index.html

nohup busybox httpd -f -p ${server_port} &
