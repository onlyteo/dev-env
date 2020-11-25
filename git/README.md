# Git Setup

### Content of .gitconfig
```ini
[user]
	name = Teo
	email = onlyteo@live.com
[alias]
	a = add
	aa = add --all
	co = checkout
	ci = commit
	cia = commit --amend
	cian = commit --amend --no-edit
	cim = commit -m
	cl = clone
	br = branch
	bru = branch -u origin/\"$(git rev-parse --abbrev-ref HEAD)\"
	st = status
	sts = status -s
	nice = log --all --graph --decorate --oneline
	lol = log --all --graph --decorate --date=format:\"%Y-%m-%d %H:%M:%S\" --pretty=format:\"%C(yellow)%h%Creset %C(auto)%d%Creset %s %C(cyan)[%an <%ae> (%cn <%ce>) %cd]%Creset\" --abbrev-commit
	undo = checkout -- .
	unstage = reset --
	fi = flow init
	ff = flow feature
	ffs = flow feature start
	fff = flow feature finish
	ffp = flow feature publish
	teo = !git config user.name "Teo" && git config user.email "onlyteo@live.com"
[core]
	autocrlf = input
	longpaths = true
	excludesfile = ~/.gitignore_global
[push]
	default = simple
[fetch]
	prune = true
```
### Content of .gitignore_global
```bash
application-onlyteo*.yml
docker-compose.onlyteo.yml
logback-onlyteo.xml
```
