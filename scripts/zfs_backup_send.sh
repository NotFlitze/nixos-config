#!/usr/bin/env bash

set -euo pipefail

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RESET='\033[0m'

# Variables
POOL="nasdata"
DATASET="data"
TARGET_HOST="backup-server"
TARGET_POOL="backup"
DATESTAMP=$(date +%d%m%Y-%H%M)
SNAPSHOT_NAME="snapshot-${DATESTAMP}"
LOCAL_SNAPSHOT="${POOL}/${DATASET}@${SNAPSHOT_NAME}"
REMOTE_DATASET="${TARGET_POOL}/${DATESTAMP}"

# Output functions for clarity and color
info()    { echo -e "${CYAN}[INFO]${RESET}    $*"; }
success() { echo -e "${GREEN}[SUCCESS]${RESET} $*"; }
warn()    { echo -e "${YELLOW}[WARNING]${RESET} $*"; }
error()   { echo -e "${RED}[ERROR]${RESET}   $*"; }

echo ""
info "Starting ZFS backup operation"
echo "----------------------------------------"
echo ""
info "Creating local snapshot: ${LOCAL_SNAPSHOT}"
sudo zfs snapshot "${LOCAL_SNAPSHOT}"
echo ""
info "Sending snapshot to ${TARGET_HOST}:${REMOTE_DATASET} ..."         # if the backup-server isnt reachable it bricks it self fix that

if sudo zfs send "${LOCAL_SNAPSHOT}" | ssh "${TARGET_HOST}" "zfs receive -v ${REMOTE_DATASET}"; then
    echo ""
    success "Snapshot sent successfully."
    echo ""
    info "Destroying local snapshot: ${LOCAL_SNAPSHOT}"
    sudo zfs destroy "${LOCAL_SNAPSHOT}"
    echo ""
    success "Local snapshot destroyed."
    echo ""
    success "Backup operation completed successfully."
    echo "----------------------------------------"
else
    echo ""
    error "Snapshot transfer failed."
    echo ""
    warn "Local snapshot retained: ${LOCAL_SNAPSHOT}"
    echo "----------------------------------------"
    exit 1
fi

