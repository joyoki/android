# Joyoki adaptations

This tree is a vendored, buildable fork of [MetaCubeX/ClashMetaForAndroid](https://github.com/MetaCubeX/ClashMetaForAndroid) (mihomo / Clash.Meta core).

## Changes vs upstream

- `applicationId`: `com.joyoki.vpn` (via `local.properties` / example)
- Launcher display name: **Joyoki VPN (Clash Meta)**
- Default ABI: `arm64-v8a` for faster CI/dev builds
- Signing: `signing.properties` may set `keystore.path` (falls back to `release.keystore`)
- CMake version stamp works when git submodules are absent (vendored tree)
- Helper: `scripts/wire-local-profile.sh` copies a **local** Clash YAML into gitignored `.local-profiles/` for device import — never bake credentials into the APK

## AgentNEO

Use the panel **Clash 订阅链接** or a full Clash YAML export (e.g. `AgentNEO - ****`). Import via Profiles → URL or File. Do not commit subscription URLs or exports.

Upstream LICENSE / NOTICE apply.
