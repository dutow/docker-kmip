#!/bin/sh
/usr/local/bin/pykmip-server -f /opt/PyKMIP/server.conf &

echo "*************************"
echo "Copy Certificates"
echo "*************************"
echo "mkdir /tmp/certs"
echo "docker cp kmip:/opt/certs/root_certificate.pem /tmp/certs/"
echo "docker cp kmip:/opt/certs/client_key_jane_doe.pem /tmp/certs/"
echo "docker cp kmip:/opt/certs/client_certificate_jane_doe.pem /tmp/certs/"
echo "*************************"
echo ""
echo "*************************"
echo "component_keyring_kmip.cnf"
echo "*************************"
echo "{"
echo "  \"server_addr\": \"127.0.0.1\","
echo "  \"server_port\": \"5696\","
echo "  \"client_ca\": \"/tmp/certs/client_certificate_jane_doe.pem\","
echo "  \"client_key\": \"/tmp/certs/client_key_jane_doe.pem\","
echo "  \"server_ca\": \"/tmp/certs/root_certificate.pem\""
echo "}"
echo "*************************"
echo ""
echo "*************************"
echo "PXB"
echo "*************************"
echo "KMIP_CLIENT_CA=\"/tmp/certs/client_certificate_jane_doe.pem\" KMIP_CLIENT_KEY=\"/tmp/certs/client_key_jane_doe.pem\" KMIP_SERVER_CA=\"/tmp/certs/root_certificate.pem\" ./run.sh"

wait