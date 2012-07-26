neogit() {
  git config user.name "Jonas Thiel"
  git config user.email "jt@neopoly.de"
  echo -n "Name: "
  git config user.name
  echo -n "E-Mail: "
  git config user.email
}

neo(){ cd ~/Neopoly/$1; }
_neo(){ _files -W ~/Neopoly -/; }
compdef _neo neo

resin(){ mate ~/Neopoly/resin/conf/$1; }
_resin(){ _files -W ~/Neopoly/resin/conf/ -/; }
compdef _resin resin