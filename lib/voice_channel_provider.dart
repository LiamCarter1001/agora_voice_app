// lib/voice_channel_provider.dart
import 'package:flutter/material.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';

class VoiceChannelProvider with ChangeNotifier {
  late RtcEngine _engine;
  bool _isJoined = false;

  bool get isJoined => _isJoined;

  VoiceChannelProvider() {
    _initializeAgora();
  }

  Future<void> _initializeAgora() async {
    _engine = createAgoraRtcEngine();
    await _engine.initialize(const RtcEngineContext(appId: 'a0525612b6bd4104b4b991440cf2b68c'));

    // Event handlers
    _engine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (connection, elapsed) {
          _isJoined = true;
          notifyListeners();
        },
        onLeaveChannel: (connection, stats) {
          _isJoined = false;
          notifyListeners();
        },
      ),
    );
  }

  Future<void> joinChannel() async {
    await _engine.joinChannel(
      token: '007eJxTYLjPmLqtROfM/ds7eG72PZSf6Gt2gVFWtlNk+fkdVtbzvZ8rMCQamBqZmhkaJZklpZgYGpgkmSRZWhqamBgkpwHFLJJPNSqlNwQyMqhPncjKyACBID4PQ3JiTk58ckZiXl5qDgMDADHYIbk=',
      channelId: 'call_channel',
      uid: 0,
      options: const ChannelMediaOptions(),
    );
  }

  Future<void> leaveChannel() async {
    await _engine.leaveChannel();
  }

  @override
  void dispose() {
    _engine.release();
    super.dispose();
  }
}
