
#!/bin/bash

date	# displays the time when the script starts running

echo Hello $USER ! 					# Greeting the user with the user's name
echo You are running $OSTYPE		# Tell user what operating system is running
echo This script installs all the programs and dependancies needed for the project. 
echo Programs that will be installed are: 
echo "   Sublime Text 3"
echo "   Git"
echo Are you sure you want to continue?  [y/n]
read ans

if [ $ans == 'y' ] || [ $ans == 'Y' ] 
then
	startTime=$(date +%s%N) # Saves start time to display the runtime, after all installations have been made. 

	SUCC=""
	ERRORLOG="error-script.log"

	#======Sublime=========
	# Installing GPG key for Sublime
	wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add - && { 
		SUCC+="$(date): Sublime - Installing GPG key worked \n" 
	} || {
		echo "$(date): Sublime - Installing GPG key failed" >> $ERRORLOG;
		exit 1;
	}
	# Making sure apt is set up to work with http resources
	sudo apt-get install apt-transport-https -y && {
		SUCC+="$(date): Sublime - setup apt to work with http resources worked \n" 
	} || {
		echo "$(date): Sublime - setup apt to work with http resources failed" >> $ERRORLOG;
		exit 1;
	}
	# Choosing to use the stable version of Sublime, not the developer version.
	echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list && {
		SUCC+="$(date): Sublime - selecting the stable channel worked \n" 
	} || { 
		echo "$(date): Sublime - selecting the stable channel failed" >> $ERRORLOG;
		exit 1;
	}
	# Updating apt-get
	sudo apt-get update -y && {
		SUCC+="$(date): Sublime - apt sources updated \n" 
	}|| {
		echo "$(date): Sublime - failed to update apt sources" >> $ERRORLOG;
		exit 1;
	}
	# Installing sublime
	sudo apt-get install sublime-text -y && {
		SUCC+="$(date): Sublime Text installed \n" 
	}|| {
		echo "$(date): Sublime Text could not be installed" >> $ERRORLOG;
		exit 1;
	}


	#======Git===========
	# Installing Git with apt-get
	sudo apt-get install git-all -y	&& {
		SUCC+="$(date): Git was installed \n" 
	} || {
		echo -e "$(date): Git could not be installed " >> $ERRORLOG;
		exit 1;
	}


	#===If all installations were successfull, a success log is made at the current directory named .log
	if [[ -z $ERRORS ]] # skilar true ef ERRORS er af lengd 0
	then
		echo -e $SUCC >> .log
	fi
fi


date		#displays the time when the scripts stops running

runtime=$((($(date +%s%N) - $startTime)/1000000)); #calculates teh runtime in milliseconds
echo The script took $runtime milliseconds to run.  