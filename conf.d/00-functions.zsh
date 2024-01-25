#!/usr/bin/env zsh

list_aws_profiles() {
    local config_file="${HOME}/.aws/config"

    # Check if config file exists
    if [[ ! -f $config_file ]]; then
        >&2 echo "The AWS config file does not exist: $config_file"
        return 1
    fi

    echo default
    grep -o -E '\[profile[^]]*' $HOME/.aws/config | cut -d' ' -f2
}

alias awp="list_aws_profiles"


# TODO: Fix lack of output on valid file
check_json_file()
{
  local file_name="$1"

  [ -e "$file_name" ] || echo "$0: File name: \"$file_name\" could not be found." >&2 && return 1

  (cat "$file_name" | jq > /dev/null) \
  && echo "file \"$file_name\" is valid JSON." >&2 \
  || echo "$file_name"
}

bulk-ssm()
{
  docker run \
    --rm \
    -v $(pwd):/working \
    -e AWS_ACCESS_KEY_ID \
    -e AWS_SECRET_ACCESS_KEY \
    -e AWS_SESSION_TOKEN \
    -e AWS_SESSION_EXPIRES \
    -it \
    bulk-ssm-image "$@"
}


random_name()
{
  name_length=${1:-100}

  cat /dev/urandom \
  | base64 \
  | tr -dc '0-9a-zA-Z' \
  | head -c"${name_length}"
}


iter()
{
  git diff --cached --exit-code > /dev/null \
    && echo "No changes ready to commit." \
    && return

  git commit \
    --amend \
    --no-edit \
    "$@"

  git push \
    --force-with-lease
}


get_default_git_branch()
{
  git remote show origin | sed -n '/HEAD branch/s/.*: //p'
}


nfb()
{
  default_branch=$(git remote show origin | sed -n '/HEAD branch/s/.*: //p')

  branch_name=${1:-$(random_name 10)}

  git fetch --all && git checkout -b "$branch_name" "origin/$default_branch"
  git branch --unset-upstream
}


update-git-branches()
{
  git fetch --all

  local current_branch="$(git branch --show-current)"
  local default_branch="$(get_default_git_branch)"

  local stash="$(git diff --exit-code > /dev/null || git stash && true)"

  for b in $(git branch); do
    if [[ "$b" == "$default_branch" || "$b" == '*' ]]; then continue; fi
    echo "Rebasing ${b}:"
    git switch "${b}"
    git rebase "${default_branch}"
    git status \
      | grep 'rebase in progress' \
      && echo "NonInteractive rebase of ${b} failed. Manual changes required." \
      && git rebase --abort
    echo "\n"
  done

  [[ -z "$stash" ]] || git stash pop
  git switch "${current_branch}"
}


summarize-git-branches()
{
  local current_branch="$(git branch --show-current)"
  local default_branch="$(get_default_git_branch)"

  for b in $(git branch); do
    if [[ "$b" == "$default_branch" || "$b" == '*' ]]; then continue; fi
    echo "Diff stats for ${b}:"
    git diff -w --stat "$default_branch" "$b"
    echo "\n"
  done
}


gprefix()
{
  local prefix="$1"
  local current_branch="$(git branch --show-current)"

  git branch -m "${prefix}_${current_branch}"
}


gsuffix()
{
  local suffix="$1"
  local current_branch="$(git branch --show-current)"

  git branch -m "${current_branch}_${suffix}"
}


Invoke-Pester()
{
  pwsh -NoProfile -NonInteractive -c "Invoke-Pester $@"
}
