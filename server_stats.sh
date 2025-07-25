    #!/bin/bash

    get_cpu_usage(){
    echo "CPU Usage"
    mpstat | awk '$12 ~ /[0-9.]+/{ print 100 - $12"% used" }'
    }

    get_memory_usage(){
    echo "Memory Usage"
    free -m | awk 'NR==2{printf "Memory Usage: %s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2}'
    }

    get_disk_usage(){
    echo "Disk Usage"
    df -h --total | awk 'END{print "Used: " $3 ", Free: " $4 ", Usage: " $5}'
    }

    get_top_cpu_processes(){
    echo "Top 5 Processes by CPU Usage"
    ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6
    }

    get_top_mem_processes(){
    echo "Top 5 Processes by Memory Usage"
    ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 6
    }

    get_extra_stats(){
    echo "OS Version:"
    lsb_release -a 2>/dev/null || cat /etc/os-release

    echo "Uptime:"
    uptime

    echo "Load Average:"
    cat /proc/loadavg

    echo "Logged in users:"
    who
    }


    main(){
    echo "Server Performance Stats"
    echo "-----------------------------"
    get_cpu_usage
    get_memory_usage
    get_disk_usage
    get_top_cpu_processes
    get_top_mem_processes
    get_extra_stats
    }

    main