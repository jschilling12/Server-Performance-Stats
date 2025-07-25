# Server-Performance-Stats
Goal of this project is to write a script to analyze server performance stats.

How to Run It:
Save the script to a file, server_stats.sh

Make it executable:
chmod +x server_stats.sh

Run the script:
./server_stats.sh

1. CPU Usage
To check CPU usage, I used mpstat and calculated the active usage by subtracting idle percentage:

2. Memory Usage
Using free -m and awk, I displayed memory usage in MB and percent:

3. Disk Usage
To show total disk usage, I used df -h --total and extracted relevant fields:

4. Top Processes
To identify top resource-consuming processes:

get_top_cpu_processes(){
  echo "Top 5 CPU-Intensive Processes:"
  ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6
}

get_top_mem_processes(){
  echo "Top 5 Memory-Intensive Processes:"
  ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 6
}

These functions provide a quick system resource snapshot for monitoring and troubleshooting.
https://roadmap.sh/projects/server-stats
