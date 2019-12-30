# disable macOS bash deprecation warning
export BASH_SILENCE_DEPRECATION_WARNING=1

# configure bash history
export HISTCONTROL=ignoredups:erasedups  			# no duplicate entries
export HISTSIZE=100000                   			# many commands in ongoing session memory
export HISTFILESIZE=100000               			# many lines in .bash_history
shopt -s histappend                     			# append to history, don't overwrite it
export PROMPT_COMMAND='history -a;history -n' # update history in real time 

# set PATH
export GOPATH=$(go env GOPATH)
export PATH=${PATH}:$(go env GOPATH)/bin
export PATH=${PATH}:~/bin
export PATH=/usr/local/opt/python/libexec/bin:${PATH}

# disable ansible cowsay
export ANSIBLE_NOCOWS=1

# use github/hub as a git
eval "$(hub alias -s)"

# enable bash completion for all brew apps
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# source useful functions
if [ -f ${HOME}/.docker-functions ]; then
  . ${HOME}/.docker-functions
fi

if [ -f ${HOME}/.terraform-functions ]; then
  . ${HOME}/.terraform-functions
fi

if [ -f ${HOME}/.other-functions ]; then
  . ${HOME}/.other-functions
fi

# enable iterm2 shell integration
if [ -f ${HOME}/.iterm2_shell_integration.bash ]; then
  . ${HOME}/.iterm2_shell_integration.bash
fi

# enable git prompt
if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
  GIT_PROMPT_ONLY_IN_REPO=1
  source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
fi

# configure terraform logging
if [ -d ${HOME}/.terraform.d/logs ]; then
  export TF_LOG=ERROR
  export TF_LOG_PATH="${HOME}/.terraform.d/logs/terraform.log"
fi

# export PS1='`echo "${PWD%/*}" | sed -e "s;\(/.\)[^/]*;\1;g"`/${PWD##*/} \$ '
# source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
# export PS1='\u@\h \W $(kube_ps1)$ '
# kubeoff

# use swarm as a docker default orchestrator
export DOCKER_STACK_ORCHESTRATOR=swarm

