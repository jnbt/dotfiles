vhosts(){ mate /etc/apache2/extra/httpd-vhosts.conf; }
hosts(){ mate /etc/hosts; }

c(){ cd ~/Inwork/$1; }
_c(){ _files -W ~/Inwork -/; }
compdef _c c

# autocorrect is more annoying than helpful
unsetopt correct_all
