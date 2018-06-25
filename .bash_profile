export GOPATH=$(go env GOPATH)
export PATH=$PATH:$(go env GOPATH)/bin
export PATH=$PATH:~/bin

export ANSIBLE_NOCOWS=1

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

if [ -f ${HOME}/.docker-functions ]; then
  . ${HOME}/.docker-functions
fi

if [ -f ${HOME}/.other-functions ]; then
  . ${HOME}/.other-functions
fi

if [ -f ${HOME}/.iterm2_shell_integration.bash ]; then
  . ${HOME}/.iterm2_shell_integration.bash
fi

if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
  GIT_PROMPT_ONLY_IN_REPO=1
  source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
fi

if [ -d ${HOME}/.terraform.d/logs ]; then
  export TF_LOG=ERROR
  export TF_LOG_PATH="${HOME}/.terraform.d/logs/terraform.log"
fi

# export PS1='`echo "${PWD%/*}" | sed -e "s;\(/.\)[^/]*;\1;g"`/${PWD##*/} \$ '

source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
export PS1='\u@\h \W $(kube_ps1)$ '
kubeoff

export DOCKER_ORCHESTRATOR=swarm

