import 'package:just_audio/just_audio.dart';

class AudioManager {
  late final AudioPlayer _audioPlayer;

  AudioManager() {
    _audioPlayer = AudioPlayer();
  }

  AudioPlayer get audioPlayer => _audioPlayer;
}

final audioManager = AudioManager();
