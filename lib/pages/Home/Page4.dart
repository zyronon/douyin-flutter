import 'dart:async';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

// 定义 App ID、Token 和 Channel
const appId = "6b0884a08b164ffdbffbb411e55bc38d";
const token =
    "007eJxTYCjT3DRbTfLUeu9HB3W7O2ySd+dO+FV5hOfH/RAz1tk3GdoUGMySDCwsTBINLJIMzUzS0lKS0tKSkkwMDVNNTZOSjS1SVsxlTWkIZGTQWb2ClZEBAkF8FoaS1OISBgYAaRkf+A==";
const channel = "test";

// 应用类
class Page4 extends StatefulWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  _Page4 createState() => _Page4();
}

// 应用状态类
class _Page4 extends State<Page4> {
  int? _remoteUid;
  bool _localUserJoined = false;
  late RtcEngine _engine;

  @override
  void initState() {
    print('page4-initState');
    super.initState();
    initAgora();
  }

  // 初始化应用
  Future<void> initAgora() async {
    // 获取权限
    await [Permission.microphone, Permission.camera].request();

    // 创建 RtcEngine
    _engine = await createAgoraRtcEngine();

    // 初始化 RtcEngine，设置频道场景为直播场景
    await _engine.initialize(const RtcEngineContext(
      appId: appId,
      channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
    ));

    _engine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          debugPrint("local user ${connection.localUid} joined");
          setState(() {
            _localUserJoined = true;
          });
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          debugPrint("remote user $remoteUid joined");
          setState(() {
            _remoteUid = remoteUid;
          });
        },
        onUserOffline: (RtcConnection connection, int remoteUid, UserOfflineReasonType reason) {
          debugPrint("remote user $remoteUid left channel");
          setState(() {
            _remoteUid = null;
          });
        },
      ),
    );
    // 开启视频
    await _engine.enableVideo();
    await _engine.startPreview();
    // 加入频道，设置用户角色为主播
    await _engine.joinChannel(
      token: token,
      channelId: channel,
      options: const ChannelMediaOptions(clientRoleType: ClientRoleType.clientRoleBroadcaster),
      uid: 0,
    );
  }

  // 构建 UI，显示本地视图和远端视图
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: _remoteVideo(),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: SizedBox(
            width: 100,
            height: 150,
            child: Center(
              child: _localUserJoined
                  ? AgoraVideoView(
                controller: VideoViewController(
                  rtcEngine: _engine,
                  canvas: const VideoCanvas(uid: 0),
                ),
              )
                  : const CircularProgressIndicator(),
            ),
          ),
        ),
      ],
    );
  }

  // 生成远端视频
  Widget _remoteVideo() {
    if (_remoteUid != null) {
      return AgoraVideoView(
        controller: VideoViewController.remote(
          rtcEngine: _engine,
          canvas: VideoCanvas(uid: _remoteUid),
          connection: const RtcConnection(channelId: channel),
        ),
      );
    } else {
      return const Text(
        'Please wait for remote user to join',
        textAlign: TextAlign.center,
      );
    }
  }
}
