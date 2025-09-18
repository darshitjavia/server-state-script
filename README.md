# **Server Performance Analysis Script (server-stats.sh)**

A simple and portable Bash script designed to display essential performance statistics for any Linux server. It is perfect for system administrators and developers who need a quick, real-time health check without installing heavy monitoring agents. The script provides a clean, color-coded overview of CPU, memory, and disk usage, as well as the top resource-consuming processes.

## **Features**

The script analyzes and displays the following key server statistics:

* **Total CPU Usage:** The current overall CPU utilization percentage. This metric provides a snapshot of how busy the processor is at the moment of execution.  
* **Total Memory Usage:** A detailed breakdown of total, used, and free system RAM in megabytes (MB), including the percentage of memory currently in use. This is critical for identifying potential memory leaks or insufficient resources.  
* **Total Disk Usage:** A breakdown of total, used, and free space for the root (/) filesystem. This check is crucial for preventing service outages that can occur when a disk runs out of space.  
* **Top 5 Processes by CPU:** A list of the 5 most CPU-intensive processes currently running. This helps pinpoint applications that are consuming the most processing power.  
* **Top 5 Processes by Memory:** A list of the 5 most memory-intensive processes. This is useful for identifying which applications are taking up the most RAM.

## **Requirements**

* A Linux-based operating system (e.g., Ubuntu, CentOS, Debian, Fedora, RHEL, etc.).  
* Standard command-line utilities (top, free, df, ps, awk), which are pre-installed on virtually all modern Linux distributions. The script is lightweight and has no external dependencies.

## **How to Use**

Follow these simple steps to get the script running on your server.

1. Download the Script  
   Save the server-stats.sh file to a directory on your server. You can also download it directly from the terminal using a tool like wget or curl.  
2. Make it Executable  
   Open your terminal and navigate to the directory where you saved the script. You need to grant the file execution permissions before you can run it. This is a security measure in Linux to prevent accidental execution.  
   chmod \+x server-stats.sh

3. Run the Script  
   Execute the script from your terminal. It requires no command-line arguments.  
   ./server-stats.sh

   The script will immediately print the formatted server statistics to your console. For easier access, you can move the script to a directory in your system's PATH (e.g., /usr/local/bin).

### **Example Output**

\=============================================  
        Server Performance Statistics  
    Generated on: Fri Sep 19 00:00:00 IST 2025  
\=============================================

\--- CPU Usage \---  
Total CPU Usage: 5.12%

\--- Memory Usage \---  
Total Memory: 15922 MB  
Used Memory:  4580 MB (28%)  
Free Memory:  11342 MB

\--- Disk Usage (Root Filesystem) \---  
Total Space: 228G  
Used Space:  114G (53%)  
Free Space:  115G

\--- Top 5 Processes by CPU Usage \---  
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND  
root         1  0.1  0.1 167620  9380 ?        Ss   Sep18   0:01 /sbin/init  
johndoe   1234  0.1  0.5 876543 45678 ?        Sl   Sep18   0:30 /usr/lib/firefox/firefox  
mysql     5678  0.0  2.1 1234567 189012 ?       Sl   Sep18   0:15 /usr/sbin/mysqld  
...

\--- Top 5 Processes by Memory Usage \---  
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND  
mysql     5678  0.0  2.1 1234567 189012 ?       Sl   Sep18   0:15 /usr/sbin/mysqld  
johndoe   1234  0.1  0.5 876543 45678 ?        Sl   Sep18   0:30 /usr/lib/firefox/firefox  
...  
\=============================================

## **Portability**

This script is intentionally designed for maximum portability. It avoids using any distribution-specific commands or flags. Instead, it relies on a core set of POSIX-compliant utilities (ps, df, awk, etc.) that are guaranteed to be present and function consistently across a wide range of Linux systems. This ensures that the script will work out-of-the-box without modification, whether you are on a Debian-based server or an RHEL-based enterprise system.

https://roadmap.sh/projects/server-stats
