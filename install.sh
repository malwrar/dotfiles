#!/usr/bin/env bash
set -e

LOCAL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOSTS="$LOCAL_DIR/hosts"
PLAYBOOK="$LOCAL_DIR/dotfiles.yml"

# Runs Ansible playbook using our user.
#ansible-playbook -i "$HOSTS" "$PLAYBOOK" --ask-become-pass
ansible-playbook -i "$HOSTS" "$PLAYBOOK"

exit 0
