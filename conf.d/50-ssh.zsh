export APPLE_SSH_ADD_BEHAVIOR=openssh

function ssh-setup() {
  set -x
  2>&1 echo $(date)

  ssh-add -L || {
    2>&1 echo "No identities found. Running ssh-add"
    ssh-add --apple-load-keychain --apple-use-keychain
    ssh-add -L
  }
  set +x
}

function ssh-setup-complete() {
  local logdir="${XDG_STATE_HOME:-$HOME/.local/state}/logs"
  mkdir -p $logdir
  local logfile="${logdir}/$(date --iso-8601)-$$-ssh-setup.log"

  echo "Finished loading SSH Keys" > "$logfile"
  echo $5 > "$logfile"
  echo $3 > "$logfile"

  async_stop_worker ssh-setup
}

async_init
async_start_worker ssh-setup
async_job ssh-setup ssh-setup
async_register_callback ssh-setup ssh-setup-complete
