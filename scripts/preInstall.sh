set env vars
set -o allexport; source .env; set +o allexport;


mkdir -p ./app
mkdir -p ./elasticsearch
chown -R 1000:1000 ./app
chown -R 1000:1000 ./elasticsearch

cat <<EOT > ./servers.json
{
    "Servers": {
        "1": {
            "Name": "local",
            "Group": "Servers",
            "Host": "172.17.0.1",
            "Port": 34231,
            "MaintenanceDB": "postgres",
            "SSLMode": "prefer",
            "Username": "postgres",
            "PassFile": "/pgpass"
        }
    }
}
EOT
