import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

class ChatSound {
  ChatSound._privateConstructor();
  static final ChatSound instance = ChatSound._privateConstructor();

  void playRingTone(bool isCaller) {
    FlutterRingtonePlayer.play(
      android: isCaller ? AndroidSounds.alarm : AndroidSounds.ringtone,
      ios: isCaller ? IosSounds.horn : IosSounds.triTone,
      looping: true, // Android only - API >= 28
      volume: 0.1, // Android only - API >= 28
      asAlarm: false, // Android only - all APIs
    );
  }

  void stopRingTone() {
    FlutterRingtonePlayer.stop();
  }
}
