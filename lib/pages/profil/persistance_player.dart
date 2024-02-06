import 'package:flutter/material.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:musik/controllers/audio_manager.dart';
import 'package:musik/utils/colors.dart';

class PersistentPlayerBar extends StatefulWidget {
  const PersistentPlayerBar({super.key});

  @override
  State<PersistentPlayerBar> createState() => _PersistentPlayerBar();
}

class _PersistentPlayerBar extends State<PersistentPlayerBar> {
  _PersistentPlayerBar();
  bool loaded = true;
  bool playing = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: backgroundColor,
      child: StreamBuilder<Duration>(
        stream: audioManager.audioPlayer.positionStream,
        builder: (context, snapshot) {
          final position = snapshot.data ?? const Duration();
          final duration =
              audioManager.audioPlayer.duration ?? const Duration();

          return Column(children: [
            ProgressBar(
              progress: position,
              total: duration,
              progressBarColor: buttonColor,
              baseBarColor: Colors.grey[200],
              bufferedBarColor: Colors.grey[350],
              thumbColor: buttonColor,
              timeLabelPadding: -1,
              timeLabelTextStyle:
                  const TextStyle(fontSize: 12, color: Colors.white),
            ),
            Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: buttonColor),
              child: IconButton(
                  onPressed: loaded
                      ? () {
                          if (playing) {
                            audioManager.audioPlayer.pause();
                            playing = false;
                          } else {
                            audioManager.audioPlayer.play();
                            playing = true;
                          }
                        }
                      : null,
                  icon: Icon(
                    playing ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                  )),
            ),
          ]);
        },
      ),
    );
  }
}
