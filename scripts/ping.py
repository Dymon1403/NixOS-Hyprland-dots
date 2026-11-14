#!/usr/bin/env python3
import subprocess

servers = [
    {"name": "server", "ip": "192.168.0.228", "user": "server", "path": "~/server"}, 
    {"name": "server", "ip": "192.168.0.109", "user": "server", "path": "~/server"}
]

for server in servers:
    print(f"Waking up {server['name']} ({server['ip']})...")
    
    ping_cmd = f"ssh {server['user']}@{server['ip']} 'pingu -c 1 google.com'" 
    result = subprocess.run(ping_cmd, shell=True, capture_output=True, text=True)
    
    if result.returncode == 0:
        for line in result.stdout.splitlines():
            if "time=" in line:
                time_str = line.split("time=")[1].strip()
                print(f"[{server['name']}]: Ping {time_str}")
                break
    else:
        print(f"[{server['name']}]: ERROR")
