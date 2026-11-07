# Joyoki Android VPN

本仓库在原有 AOSP manifest（`default.xml`）之外，新增可构建的 Android VPN 客户端：

- 目录：[`vpn-client/`](vpn-client/)
- 基于开源 [Clash Meta for Android](https://github.com/MetaCubeX/ClashMetaForAndroid)（mihomo 内核）
- 兼容 AgentNEO 面板的 **Clash 订阅链接 / Clash YAML**

## 快速构建

见 Project 文档（云端）：`docs/android-vpn-setup.md`，或：

```bash
cd vpn-client
cp local.properties.example local.properties  # 设置 sdk.dir
./gradlew app:assembleMetaRelease
```

## 许可

`vpn-client/` 保留上游 LICENSE / NOTICE。本仓库适配层不提供任何代理服务；节点与订阅由用户自行从服务商获取。
