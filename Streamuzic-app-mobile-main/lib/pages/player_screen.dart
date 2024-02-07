import 'package:flutter/material.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:musik/controllers/audio_manager.dart';
import 'package:musik/models/song_model.dart';
import 'package:musik/utils/colors.dart';

class PlayerScreen extends StatefulWidget {
  final SongModel song;

  const PlayerScreen({
    Key? key,
    required this.song,
  }) : super(key: key);

  @override
  State<PlayerScreen> createState() => _PlayerScreen();
}

class _PlayerScreen extends State<PlayerScreen> {
  late final SongModel songplayer;
  // Insert your thumbnail URL
  bool loaded = false;
  bool playing = false;

  @override
  void initState() {
    // Initialize the music URL using the provided song
    songplayer = widget.song;
    loadMusic();
    super.initState();
  }

  void loadMusic() async {
    await audioManager.audioPlayer.setUrl(songplayer.trackid!);
    setState(() {
      loaded = true;
    });
  }

  void playMusic() async {
    setState(() {
      playing = true;
    });
    await audioManager.audioPlayer.play();
  }

  void pauseMusic() async {
    setState(() {
      playing = false;
    });
    await audioManager.audioPlayer.pause();
  }

  @override
  void dispose() {
    //audioManager.audioPlayer.dispose();
    setState(() {
      playing = false;
    });
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        toolbarHeight: 80.0,
        backgroundColor: backgroundColor,
        leading: BackButton(
          color: buttonColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          const Spacer(
            flex: 1,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(
              songplayer.coverImageUrl!,
              height: 180,
              width: 180,
              fit: BoxFit.cover,
            ),
          ),
          Column(children: [
            const SizedBox(
              height: 8,
            ),
            Text(
              songplayer.songname!,
              style: const TextStyle(color: buttonColor, fontWeight: FontWeight.bold, fontSize: 24),
            ),
            Text(
              songplayer.name!,
              style:
                  const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ]),
          const Spacer(
            flex: 3,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: StreamBuilder(
                stream: audioManager.audioPlayer.positionStream,
                builder: (context, snapshot1) {
                  final Duration duration = loaded
                      ? snapshot1.data as Duration
                      : const Duration(seconds: 0);
                  return StreamBuilder(
                      stream: audioManager.audioPlayer.bufferedPositionStream,
                      builder: (context, snapshot2) {
                        final Duration bufferedDuration = loaded
                            ? snapshot2.data as Duration
                            : const Duration(seconds: 0);
                        return SizedBox(
                          height: 30,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: ProgressBar(
                              progress: duration,
                              total:
                                  audioManager.audioPlayer.duration ?? const Duration(seconds: 0),
                              buffered: bufferedDuration,
                              timeLabelPadding: -1,
                              timeLabelTextStyle: const TextStyle(
                                  fontSize: 14, color: Colors.white),
                              progressBarColor: buttonColor,
                              baseBarColor: Colors.grey[200],
                              bufferedBarColor: Colors.grey[350],
                              thumbColor: buttonColor,
                              onSeek: loaded
                                  ? (duration) async {
                                      await audioManager.audioPlayer.seek(duration);
                                    }
                                  : null,
                            ),
                          ),
                        );
                      });
                }),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                width: 10,
              ),
              IconButton(
                  onPressed: loaded
                      ? () async {
                          if (audioManager.audioPlayer.position.inSeconds >= 10) {
                            await audioManager.audioPlayer.seek(Duration(
                                seconds: audioManager.audioPlayer.position.inSeconds - 10));
                          } else {
                            await audioManager.audioPlayer.seek(const Duration(seconds: 0));
                          }
                        }
                      : null,
                  icon: const Icon(
                    Icons.fast_rewind_outlined,
                    color: Colors.white,
                    size: 30.0,
                  )),
              Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: buttonColor),
                child: IconButton(
                    onPressed: loaded
                        ? () {
                            if (playing) {
                              pauseMusic();
                            } else {
                              playMusic();
                            }
                          }
                        : null,
                    icon: Icon(
                      playing ? Icons.pause : Icons.play_arrow,
                      color: Colors.white,
                    )),
              ),
              IconButton(
                  onPressed: loaded
                      ? () async {
                          if (audioManager.audioPlayer.position.inSeconds + 10 <=
                              audioManager.audioPlayer.duration!.inSeconds) {
                            await audioManager.audioPlayer.seek(Duration(
                                seconds: audioManager.audioPlayer.position.inSeconds + 10));
                          } else {
                            await audioManager.audioPlayer.seek(const Duration(seconds: 0));
                          }
                        }
                      : null,
                  icon: const Icon(
                    Icons.fast_forward_outlined,
                    color: Colors.white,
                    size: 30.0,
                  )),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          const Spacer(
            flex: 2,
          )
        ],
      ),
    );
  }
}
