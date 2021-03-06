#!/usr/bin/env bash
set -e

LOCAL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOSTS="$LOCAL_DIR/hosts"
PLAYBOOK="$LOCAL_DIR/kashyyyk.yml"

# Runs Ansible playbook using our user.
#ansible-playbook -i "$HOSTS" "$PLAYBOOK" --ask-become-pass
ANSIBLE_COW_SELECTION=random ansible-playbook -i "$HOSTS" "$PLAYBOOK"

exit 0
