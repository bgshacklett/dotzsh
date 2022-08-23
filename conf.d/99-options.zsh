# Don't show AWS prompt from plugin
export SHOW_AWS_PROMPT=false
export SPACESHIP_GCLOUD_SHOW=false

# Enable case-insensitive completions
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# Enable interactive comments, because why the fark should they have been
# disabled in the first place?
setopt interactive_comments
