#!/bin/bash
# Update and install Nginx
sudo apt update -y
sudo apt install nginx -y

# Start and enable Nginx service
sudo systemctl start nginx
sudo systemctl enable nginx

# Create a landing page
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sharik | Cloud & DevOps Engineer</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: #0f172a; color: white; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; overflow: hidden; }
        .card { background: #1e293b; padding: 3rem; border-radius: 24px; box-shadow: 0 20px 50px rgba(0,0,0,0.7); text-align: center; border: 2px solid #38bdf8; max-width: 500px; position: relative; }
        .card::before { content: ""; position: absolute; top: -2px; left: -2px; right: -2px; bottom: -2px; background: linear-gradient(45deg, #38bdf8, #818cf8, #38bdf8); z-index: -1; border-radius: 26px; opacity: 0.3; }
        h1 { color: #38bdf8; margin-bottom: 10px; font-size: 3rem; letter-spacing: -1px; }
        p.subtitle { color: #94a3b8; font-size: 1.4rem; margin-top: 0; margin-bottom: 25px; font-weight: 300; }
        .tag-container { margin-bottom: 30px; }
        .tag { background: rgba(56, 189, 248, 0.1); color: #38bdf8; padding: 8px 18px; border-radius: 50px; font-size: 0.9rem; margin: 6px; display: inline-block; border: 1px solid rgba(56, 189, 248, 0.3); font-weight: 600; text-transform: uppercase; }
        .status-bar { background: rgba(34, 197, 94, 0.1); color: #22c55e; padding: 10px 20px; border-radius: 12px; display: inline-flex; align-items: center; font-size: 0.85rem; font-weight: bold; letter-spacing: 1px; margin-bottom: 20px; }
        .pulse { width: 10px; height: 10px; background: #22c55e; border-radius: 50%; margin-right: 12px; box-shadow: 0 0 12px #22c55e; animation: blink 1.2s infinite; }
        @keyframes blink { 0% { opacity: 0.4; } 50% { opacity: 1; } 100% { opacity: 0.4; } }
        .footer-text { margin-top: 20px; color: #64748b; font-size: 0.85rem; border-top: 1px solid #334155; padding-top: 20px; }
    </style>
</head>
<body>
    <div class="card">
        <div class="status-bar">
            <div class="pulse"></div> DEPLOYED VIA TERRAFORM
        </div>
        <h1>Sharik Ahmad</h1>
        <p class="subtitle">Cloud & DevOps Engineer</p>
        <div class="tag-container">
            <span class="tag">Azure Cloud</span>
            <span class="tag">Terraform IaC</span>
            <span class="tag">Nginx</span>
            <span class="tag">Azure DevOps</span>
        </div>
        <div class="footer-text">
            "Automating Infrastructure with Precision"
        </div>
    </div>
</body>
</html>
EOF