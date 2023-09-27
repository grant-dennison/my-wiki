echo -n "Vault file: "
read -s VAULT_FILE

echo -n "Vault password: "
read -s VAULT_PASSWORD

clear_previous_line() {
  tput cuu1
  tput el
}

wait_and_clear() {
  read -p "Press Enter to clear the previous two lines..."
  clear_previous_line
  clear_previous_line
}

pull_from_vault() {
  grep "$1:" "$VAULT_FILE" | awk -F ': ' '{print $2}'
}

encrypt() {
  echo -n "New password: " 1>&2
  read -s NEW_PASSWORD
  echo 1>&2
  echo -n "$NEW_PASSWORD" | openssl enc -aes-256-cbc -pbkdf2 -iter 20000 -md sha256 -salt -a -pass "pass:$VAULT_PASSWORD" -e
}

decrypt() {
  echo "$1" | openssl enc -aes-256-cbc -pbkdf2 -iter 20000 -md sha256 -salt -a -pass "pass:$VAULT_PASSWORD" -d
  echo
  wait_and_clear
}

decrypt_from_vault() {
  decrypt "$(pull_from_vault "$1")"
}

encrypt_to_vault() {
  NEW_PASSWORD=$(encrypt)
  echo "$1: $NEW_PASSWORD" >> "$VAULT_FILE"
}
