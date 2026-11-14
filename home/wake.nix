import subprocess

servers = [
    {"name": "T430", "ip": "192.168.0.228", "user": "server", "path": "~/server"}, 
    {"name": "Compaq", "ip": "192.168.0.109", "user": "server", "path": "~/compaq"}
]

for server in servers:
    print(f"Starting {server['name']} ({server['ip']})...")
    
    ssh_cmd = f"ssh {server['user']}@{server['ip']} 'cd {server['path']} && docker compose up -d && docker start tg-ws-proxy'"
    
    result = subprocess.run(ssh_cmd, shell=True, capture_output=True, text=True)
    
    if result.returncode == 0:
        print(f"[{server['name']}]: Successfully started!")
        print(result.stdout)
    else:
        print(f"[{server['name']}]: error: {result.stderr}")
