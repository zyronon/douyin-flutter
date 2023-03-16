# hope

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


flutter build apk --target-platform android-arm,android-arm64,android-x64 --split-per-abi
flutter build apk --release  --target-platform android-arm64

flutter build apk --split-per-abi
（flutter build 默认带有 --release 参数。）

这个命令会生成如下三个 APK 文件
[project]/build/app/outputs/apk/release/app-armeabi-v7a-release.apk
[project]/build/app/outputs/apk/release/app-arm64-v8a-release.apk
[project]/build/app/outputs/apk/release/app-x86_64-release.apk
如果移除 --split-per-abi 将会生成一个包含 所有 目标 ABI 的 fat APK 文件。这种 APK 文件将会在比单独构建的 APK 文件尺寸要大，会导致用户下载一些不适用于其设备架构的二进制文件。

