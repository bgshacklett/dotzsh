
KEYCHAIN_LABEL="Bitwarden API Key"

bw-login() {
  export BW_CLIENTID="$(
    security find-generic-password \
      -l "${KEYCHAIN_LABEL}" \
    | awk -F "=" '/acct/ {print $2}' | tr -d "\""
  )"

  export BW_CLIENTSECRET="$(
    security find-generic-password \
      -l "${KEYCHAIN_LABEL}" \
      -w
  )"

  bw login --apikey

  export BW_SESSION="$(bw --raw unlock)"
}
