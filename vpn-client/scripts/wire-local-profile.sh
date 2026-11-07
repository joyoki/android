#!/usr/bin/env bash
# Copy a private AgentNEO Clash export into a local (gitignored) profiles dir for manual import / adb push.
# Does NOT embed secrets into the APK or git tree.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DEST_DIR="$ROOT/.local-profiles"
mkdir -p "$DEST_DIR"

STORE_INTERNAL="${AGENTNEO_STORE_INTERNAL:-/cursor/stores/bc-d55f97dd-89ed-4dc5-b456-a8c13c990a73/internal}"
SRC=""
if [[ -n "${1:-}" ]]; then
  SRC="$1"
else
  # Prefer exact meta-documented files, then glob
  for cand in \
    "$STORE_INTERNAL/agentneo-g1ek-config.yaml" \
    "$STORE_INTERNAL/agentneo-g1ek-config.yml" \
    "$STORE_INTERNAL/agentneo-g1ek-config.txt" \
    "$STORE_INTERNAL"/agentneo-g1ek-config*; do
    if [[ -f "$cand" ]]; then SRC="$cand"; break; fi
  done
fi

if [[ -z "$SRC" || ! -f "$SRC" ]]; then
  echo "No AgentNEO config found."
  echo "Place export at: $STORE_INTERNAL/agentneo-g1ek-config*  (or pass path as \$1)"
  echo "See meta: $STORE_INTERNAL/agentneo-config-meta.md"
  exit 2
fi

# Refuse to copy into tracked paths
case "$DEST_DIR" in
  */.local-profiles) ;;
  *) echo "Refusing unexpected dest"; exit 3 ;;
esac

cp -f "$SRC" "$DEST_DIR/agentneo-local.yaml"
chmod 600 "$DEST_DIR/agentneo-local.yaml"
echo "Wired local profile (gitignored): $DEST_DIR/agentneo-local.yaml"
echo "Import this file in the app (Profiles → New → File), or:"
echo "  adb push $DEST_DIR/agentneo-local.yaml /sdcard/Download/agentneo-local.yaml"
if [[ -f "$STORE_INTERNAL/agentneo-config-meta.md" ]]; then
  echo "Meta notes present: $STORE_INTERNAL/agentneo-config-meta.md"
fi
