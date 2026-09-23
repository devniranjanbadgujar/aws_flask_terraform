#!/bin/bash
set -euxo pipefail

dnf update -y
dnf install -y python3 python3-pip

mkdir -p /opt/flask-app

python3 -m venv /opt/flask-app/venv

cat > /opt/flask-app/app.py <<'PYTHON'
from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/")
def home():
    return jsonify({
        "application": "terraform-flask-app",
        "status": "UP"
    })

@app.route("/health")
def health():
    return jsonify({
        "status": "UP"
    }), 200

if __name__ == "__main__":
    app.run(
        host="0.0.0.0",
        port=5000
    )
PYTHON

/opt/flask-app/venv/bin/pip install flask

cat > /etc/systemd/system/flask-app.service <<'SERVICE'
[Unit]
Description=Terraform Flask Application
After=network-online.target
Wants=network-online.target

[Service]
Type=simple
WorkingDirectory=/opt/flask-app
ExecStart=/opt/flask-app/venv/bin/python /opt/flask-app/app.py
Restart=always
RestartSec=5
User=root

[Install]
WantedBy=multi-user.target
SERVICE

systemctl daemon-reload
systemctl enable flask-app
systemctl start flask-app