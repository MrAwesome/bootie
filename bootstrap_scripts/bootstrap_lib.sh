set -euo pipefail

if [[ "$(whoami)" != "root" ]]; then
    echo 'This script must be run as root.' >&2
    exit 1
fi

logstat() {
    echo "** $* **"
}
