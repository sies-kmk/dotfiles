# .bash_aliases Josh B version: onepointoh (9.14.2015)

#find file
alias f='find . | grep '
#search history
alias h='history | grep '
#search processes
alias p='ps aux | grep '

alias lsd='ls -d */'
alias lsb='ls -bidiv'
#alias lsl='ls -lbidiv'
alias lsd='ls -laF | grep /'
alias shutd='sudo shutdown -P now'
alias shutr='sudo shutdown -r now'

# Add repository keys (usage: addkey XXXXXXXX - last 8 digits of the key)
alias addkey='sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com'

# Cleaning
alias clean='sudo apt-get clean && sudo apt-get autoclean'
alias remove='sudo apt-get remove && sudo apt-get autoremove'
alias purge='sudo apt-get purge'

# Misellaneous
alias uuid='sudo vol_id -u' #list UUIDs
alias rfind='sudo find / -name' #find a file. Usage: rfind 'filename'
alias imount='sudo mount -o loop -t iso9660' #mount iso. Usage: imount 'filename.iso'
alias dirsize='sudo du -hx --max-depth=1' #directory size. Usage: dirsize directoryname

# Commands
alias rrsync='rsync --verbose -rtvogp --progress' 
 #alias scp='scp -c blowfish'
#alias nano='sudo nano -iSw$'
#alias cp='cp --verbose'
#alias mv='mv --verbose'

# install colordiff package :)
alias diff='colordiff'

# make mount human readable
alias mount='mount | column -t'

## new commands

#alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

# Stop after sending count ECHO_REQUEST packets #
alias ping='ping -c 5'
# Do not wait interval 1 second, go fast #
alias fastping='ping -c 100 -s.2'

## pass options to free ##
alias meminfo='free -m -l -t'

## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
