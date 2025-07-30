import 'package:audioplayers/audioplayers.dart';
import 'package:chat_bubbles/bubbles/bubble_normal_audio.dart';
import 'package:flutter/material.dart';

class AudioChatBuble extends StatefulWidget {
  const AudioChatBuble({super.key, required this.recordUrl});
  final String recordUrl;
  @override
  State<AudioChatBuble> createState() => _AudioChatBubleState();
}

class _AudioChatBubleState extends State<AudioChatBuble> {
  Duration duration = Duration();
  Duration position = Duration();
  bool isPlaying = false;
  bool isLoading = false;
  bool isPause = false;
  late AudioPlayer player;
  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    // Set the audio source
    player.setSourceUrl(widget.recordUrl);

    // Listen for duration changes
    player.onDurationChanged.listen((d) {
      setState(() {
        duration = d;
      });
    });

    // Listen for position changes
    player.onPositionChanged.listen((p) {
      setState(() {
        position = p;
      });
    });

    // Listen for playback completion
    player.onPlayerComplete.listen((event) {
      isPlaying = false;
      position = Duration.zero;
      setState(() {});
    });
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BubbleNormalAudio(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.61,
        maxHeight: MediaQuery.of(context).size.height * 0.08,
      ),

      duration: duration.inSeconds.toDouble(),
      position: position.inSeconds.toDouble(),

      isPlaying: isPlaying,
      isLoading: isLoading,
      isPause: isPause,
      onSeekChanged: (value) async {
        final newPosition = Duration(seconds: value.toInt());
        await player.seek(newPosition);
      },
      onPlayPauseButtonClick: () async {
        if (isPlaying == false) {
          await player.play(UrlSource(widget.recordUrl));
          setState(() {
            isPlaying = true;
          });
        } else {
          player.stop();
          setState(() {
            isPlaying = false;
          });
        }
      },
      sent: true,
    );
  }
}
