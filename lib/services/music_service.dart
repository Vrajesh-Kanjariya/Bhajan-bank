import 'package:just_audio/just_audio.dart';

import '../utils/utils.dart';

class MusicService {
  AudioPlayer? player;

  MusicService() {
    initPlayer();
  }

  initPlayer() {
    player = AudioPlayer();
  }

  setSong(String songPath) async {
    logs("SetSong-->");
    try {
      initPlayer();
      await player!.setAudioSource(AudioSource.asset(songPath));
      play();
      player!.setSpeed(1.0);
    } on PlayerException catch (e) {
      // iOS/macOS: maps to NSError.code
      // Android: maps to ExoPlayerException.type
      // Web: maps to MediaError.code
      logs("Error code --> ${e.code}");
      // iOS/macOS: maps to NSError.localizedDescription
      // Android: maps to ExoPlaybackException.getMessage()
      // Web: a generic message
      logs("Error message --> ${e.message}");
    } on PlayerInterruptedException catch (e) {
      // This call was interrupted since another audio source was loaded or the
      // player was stopped or disposed before this audio source could complete
      // loading.
      logs("Connection aborted --> ${e.message}");
    } catch (e) {
      // Fallback for all errors
      logs("Player Exception --> ");
      logs("$e");
    }
  }

  play() {
    logs("play -> ");
    player!.play();
  }

  pause() {
    logs("pause -> ");
    player!.pause();
  }

  dispose() {
    logs("dispose -> ");
    player!.dispose();
  }

  stop() {
    logs("stop -> ");
    player!.stop();
  }

}