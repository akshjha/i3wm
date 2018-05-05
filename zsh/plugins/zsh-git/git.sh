#!/bin/bash

DOTGIT=".git/"

function colors() {
  bld=$(tput bold)
  reset=$(tput sgr0)

  bldred=${bld}$(tput setaf 1) 
  bldgreen=${bld}$(tput setaf 2)
  bldyellow=${bld}$(tput setaf 3)
  bldblue=${bld}$(tput setaf 4)
  bldpurple=${bld}$(tput setaf 5)
  bldcyan=${bld}$(tput setaf 6) 
  bldwhite=${bld}$(tput setaf 7)

  red=$(tput setaf 1) 
  green=$(tput setaf 2)
  yellow=$(tput setaf 3)
  blue=$(tput setaf 4)
  purple=$(tput setaf 5)
  cyan=$(tput setaf 6) 
  white=$(tput setaf 7)
}

function dot_git() {
  dot_git="$(git rev-parse --git-dir 2>/dev/null)"
  printf '%s' $dot_git
}

function is_repo() {
  if [[ -n "$(dot_git)" ]]; then
    return 0 
  else
    return 1 
  fi
}

function is_clean() {
  if [ -z "$(git status --porcelain)" ]; then
    return 0
  else
    return 1
  fi
}

function branch() {
  if [ $BRANCH = true ]; then
    BRANCH="$(git symbolic-ref --short HEAD)"
    if is_clean; then
      echo "${COLOR_BRANCH_CLEAN}$BRANCH${reset}"
    else
      echo "${COLOR_BRANCH_DIRTY}$BRANCH${reset}"
    fi

  else echo '' 
  fi
}

function hash() {
  if [ $HASH = true ]; then
    HASH="$(git rev-parse --short HEAD)"
    if [ $STATUS = false ]; then
      echo "(${COLOR_HASH}$HASH${reset})"
    else
      echo "(${COLOR_HASH}$HASH${reset})$SEPERATOR"
    fi
  else echo ''
  fi
}

function status() {
  if [ $STATUS = true ]; then
    ADD=$(git status --porcelain | grep -o "A" | head -1 && git status --porcelain | grep -oE "A" | wc -l)
    MOD=$(git status --porcelain | grep -o "M" | head -1 && git status --porcelain | grep -oE "M" | wc -l)
    DEL=$(git status --porcelain | grep -o "D" | head -1 && git status --porcelain | grep -oE "D" | wc -l)
    REN=$(git status --porcelain | grep -o "R" | head -1 && git status --porcelain | grep -oE "R" | wc -l)
    COP=$(git status --porcelain | grep -o "C" | head -1 && git status --porcelain | grep -oE "C" | wc -l)
    UNT=$(git status --porcelain | grep -o "?" | head -1 && git status --porcelain | grep -oE "\?\?" | wc -l)

      if [ $HASH = false ]; then 
        echo $SEPERATOR${COLOR_ADD}$ADD ${COLOR_MOD}$MOD ${COLOR_DEL}$DEL ${COLOR_REN}$REN ${COLOR_COP}$COP ${COLOR_UNT}$UNT${reset}| tr -d '\n' | tr '0' ' ' | tr -d ' '
      else
        echo ${COLOR_ADD}$ADD ${COLOR_MOD}$MOD ${COLOR_DEL}$DEL ${COLOR_REN}$REN ${COLOR_COP}$COP ${COLOR_UNT}$UNT${reset}| tr -d '\n' | tr '0' ' ' | tr -d ' ' 
      fi

  else echo ''
  fi
}

function status_simp() {
  if [ $STATUS_SIMP = true ]; then
    MOD=$(git status --porcelain | grep -oE "M" | wc -l && echo "+")
    DEL=$(git status --porcelain | grep -oE "D" | wc -l && echo "-")
    
    if [ $DEL = 0 ]; then DEL='' 
    elif [ $MOD = 0 ]; then MOD=''
    fi

    if [ $HASH = false ]; then
      echo $SEPERATOR${COLOR_ADD}$MOD ${reset}${COLOR_DEL}$DEL${reset} | tr -d '\n' | tr -d ' '
    else
      echo ${COLOR_ADD}$MOD ${reset}${COLOR_DEL}$DEL${reset} | tr -d '\n' | tr -d ' '
    fi
  else echo ''
  fi
}

function git_info() {
	if is_repo; then
    echo $(branch)$(hash)$(status)$(status_simp)
	fi
}

SEPERATOR=":"
COLOR_BRANCH_CLEAN=${green}
COLOR_BRANCH_DIRTY=${purple}
COLOR_HASH=${blue}
COLOR_ADD=${green}
COLOR_MOD=${green}
COLOR_DEL=${red}
COLOR_REN=${cyan}
COLOR_COP=${cyan}
COLOR_UNT=${bldblue}
HASH=true
STATUS=true
STATUS_SIMP=false
BRANCH=true
colors

"$@"
