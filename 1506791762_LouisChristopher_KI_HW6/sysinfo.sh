#----------------------------- Advance Shell Scripting ---------------------------------------
continue(){
    printf "Press [Enter] key to continue..."
    read enter
    echo ""
    echo ""
    echo ""
}



while :
    do
    	date
	echo "===================="
	echo "     Main Menu"
	echo "===================="
	echo "1. Operating System Info"
	echo "2. Hardware List"
	echo "3. Free and  Used Memory"
	echo "4. Hardware Detail"
	echo "5. Exit"
	printf "Choose 1-5: "
	read input

	if [ $input -eq 1 ]
	then
	    echo "----------------------------------------------------------------"
	    echo "       System Status"
	    echo "----------------------------------------------------------------"
	    echo "Username : "$(uname)
	    echo "OS : "$(uname -sr)
	    echo "Uptime : "$(uptime | awk '{print $3 $4}')
	    echo "IP : "$(netstat -n | grep 'ESTABLISHED' | awk '{print $4}' | sort -u)
	    echo "Hostname : "$(hostname)
            continue

	elif [ $input -eq 2 ]
	then
	    echo "----------------------------------------------------------------"
	    echo "       Hardware List"
	    echo "----------------------------------------------------------------"
	    echo "Machine Hardware : "$(uname -m)
	    lshw -short 2> /dev/null
	    continue

	elif [ $input -eq 3 ]
	then
	    echo "---------------------------------------------------------------"
	    echo "	 MEMORY"
	    echo "---------------------------------------------------------------"
	    echo "******************"
	    echo "      Memory"
	    echo "******************"
	    echo "Size : "$(awk '$3=="kB"{$2=$2/1024;$3="MB"} 1' /proc/meminfo | grep 'MemTotal:' | sed -e "s/MemTotal[^:]*\://g")
	    echo "Free : "$(awk '$3=="kB"{$2=$2/1024;$3="MB"} 1' /proc/meminfo | grep 'MemFree:' | sed -e "s/MemFree[^:]*\://g")
	    echo "**********************************"
	    echo "	Memory Statistics"
	    echo "**********************************"
	    vmstat
	    echo "***********************************"
	    echo "    Top 10 cpu eating process"
	    echo "***********************************"
	    ps aux --sort=-pcpu | head -n 11 | sed -e "s/\ [^\ COMMAND]*$//g"
	    continue

	elif [ $input -eq 4 ]
	then
	    echo "===================================="
	    echo "       Hardware Detail"
	    echo "===================================="
	    echo "1. CPU"
	    echo "2. Block Devices"
	    echo "3. Back"
	    printf "Choose 1-3 : "
	    read input

	    if [ $input -eq 1 ]
	    then
		echo "------------------------------------------------------------------"
		echo "		CPU"
		echo "------------------------------------------------------------------"
		echo "Model Name : "$(cat /proc/cpuinfo | grep "model name" | sed -e "s/model\ name[^:]*\://g" | sort -u)
		echo "Frequency : "$(cat /proc/cpuinfo | grep "cpu MHz" | sed -e "s/cpu\ MHz[^:]*\://g" | sort -u)
		echo "Cache : "$(cat /proc/cpuinfo | grep "cache size" | sed -e "s/cache\ size[^:]*\://g" | sort -u)
		continue

	    elif [ $input -eq 2 ]
	    then
		echo "------------------------------------------------------------------"
		echo "		Blk"
		echo "------------------------------------------------------------------"
		lsblk
		continue

	    elif [ $input -eq 3 ]
	    then
		echo ""
		echo ""
		echo ""
	    fi

	elif [ $input -eq 5 ]
	then
	    echo "Bye Bye...."
	    exit

	else
	    echo "Wrong input..." 2> /dev/null
	    continue

	fi

done
