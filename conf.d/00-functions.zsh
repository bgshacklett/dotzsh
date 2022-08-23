#!/usr/bin/env zsh

# TODO: Fix lack of output on valid file
check_json_file()
{
  local file_name="$1"

  [ -e "$file_name" ] || echo "$0: File name: \"$file_name\" could not be found." >&2 && return 1

  (cat "$file_name" | jq > /dev/null) \
  && echo "file \"$file_name\" is valid JSON." >&2 \
  || echo "$file_name"
}

iter()
{
  git diff --cached --exit-code > /dev/null \
    && echo "No changes ready to commit." \
    && return

  # git diff --exit-code > /dev/null \
  #   || echo "Changes are waiting to be staged; cowardly refusing to proceed..." \
  #   && break

  git commit \
    --amend \
    --no-edit

  git push \
    --force-with-lease
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
