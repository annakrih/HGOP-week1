
#!/bin/bash


#start = $(date +%s)		#FIX


date	# displays the time when the script starts running


echo Hello $USER ! 					# Greeting the user with the user's name
echo This is a script that greets you and tells you what operating system you use.  #description
echo You are running $OSTYPE		# Tell user what operating system is running
echo Are you sure you want to continue?  [y/n]
read ans

if [ $ans == 'y' ] || [ $ans == 'Y' ] 
then
	sudo apt-get update				#Apt uppfært til að náð sé í nýjustu útgáfur af öllu

	# Sublime: 
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -			# Install the GPG key
	sudo apt-get install apt-transport-https													# Ensure apt is set up to work with https sources
	echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list	# Selecting the stable version of Sublime
	sudo apt-get install sublime-text		# Install Sublime Text

	# Git:
	sudo apt-get install git		# Installing git
fi


date		#displays the time when the scripts stops running
#end = $(date +%s) 			#FIX
#runtime = $((end-start))	#FIX
#echo The script took $runtime seconds to run.  #fix