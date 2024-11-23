// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';
import 'package:poswell_app/gen/colors.gen.dart';
import 'package:poswell_app/helpers/ui_helpers.dart';
import 'package:poswell_app/networks/endpoints.dart';
import 'package:rxdart/rxdart.dart';

class AudioPlayerWidget extends StatefulWidget {
  final String audioUrl;

  const AudioPlayerWidget(
      {super.key,
      required this.audioUrl});

  @override
  AudioPlayerWidgetState createState() => AudioPlayerWidgetState();
}

class AudioPlayerWidgetState extends State<AudioPlayerWidget>
    with WidgetsBindingObserver {
  final _player = AudioPlayer();
  late ConcatenatingAudioSource _playlist;
  late int id;
  // final _playlist = ConcatenatingAudioSource(
  //   children: [
  //     AudioSource.uri(Uri.parse(
  //         "https://tomerov.reigeeky.com/uploads/songs/35-2.mp3")),
  //   ],
  // );

  @override
  void initState() {
    super.initState();
    var audioUrl = "$url/${widget.audioUrl}";
    _playlist = ConcatenatingAudioSource(
      children: [
        AudioSource.uri(Uri.parse(audioUrl)),
      ],
    );
    WidgetsBinding.instance.addObserver(this);
    _init();
  }

  Future<void> _init() async {

    _player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
      log('stream error: $e');
    });
    try {
      // Load the playlist
      await _player.setAudioSource(_playlist);
    } on PlayerException catch (e) {
      log("Error : $e");
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _player.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _player.stop();
    }
  }

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        _player.positionStream,
        _player.bufferedPositionStream,
        _player.durationStream,
        (position, bufferedPosition, duration) =>
            PositionData(position, bufferedPosition, duration ?? Duration.zero),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        StreamBuilder<PositionData>(
          stream: _positionDataStream,
          builder: (context, snapshot) {
            final positionData = snapshot.data;
            // print("Current Position =======> ${positionData?.position.toString().split('.').first}");
            // print(
            //     "Total Duration =======> ${positionData?.duration.toString().split('.').first}");
            return SeekBar(
              duration: positionData?.duration ?? Duration.zero,
              position: positionData?.position ?? Duration.zero,
              bufferedPosition: positionData?.bufferedPosition ?? Duration.zero,
              onChangeEnd: _player.seek,
            );
          },
        ),
        const SizedBox(height: 16),
        ControlButtons(
          _player,
        ),
      ],
    );
  }
}

class ControlButtons extends StatelessWidget {
  final AudioPlayer player;

  const ControlButtons(this.player,
      {super.key,});

  @override
  Widget build(BuildContext context) {
    String formatDateandTime(DateTime dateTime) {
      final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
      return formatter.format(dateTime);
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Previous button
        IconButton(
          icon: const Icon(
            Icons.skip_previous_rounded,
            color: AppColors.allPrimaryColor,
          ),
          iconSize: 38.sp,
          onPressed: () {
            
              final currentPosition =  player.position;
            final newPosition = currentPosition - const Duration(seconds: 10);
            player.seek(newPosition < Duration.zero ? Duration.zero : newPosition);
            
          },
        ),

        // Play/Pause button
        Container(
          height: 36.h,
          width: 36.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.allPrimaryColor,
            borderRadius: BorderRadius.circular(100),
          ),
          child: StreamBuilder<PlayerState>(
            stream: player.playerStateStream,
            builder: (context, snapshot) {
              final playerState = snapshot.data;
              final processingState = playerState?.processingState;
              final playing = playerState?.playing;
              if (processingState == ProcessingState.loading ||
                  processingState == ProcessingState.buffering) {
                return Container(
                  height: 36.0.h,
                  width: 36.0.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.allPrimaryColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    width: 36.0.w,
                    height: 36.0.h,
                    child: CircularProgressIndicator(
                      color: AppColors.cFFFFFF,
                      strokeWidth: 2.w,
                    ),
                  ),
                );
              } else if (playing != true) {
                return GestureDetector(
                  onTap: () {
                    player.play();
                  },
                  child: const Center(child: Icon(Icons.play_arrow, color: AppColors.cFFFFFF)));
              } else if (processingState != ProcessingState.completed) {
                // Load complete Add Play Song API

                return IconButton(
                  color: AppColors.cFFFFFF,
                  icon: const Icon(
                    Icons.pause,
                  ),
                  iconSize: 24.0,
                  onPressed: player.pause,
                );
              } else {
                // Complete Call Complete Audio API
                DateTime date = DateTime.now();
                final formattedDate = formatDateandTime(date);
                log(formattedDate);
                // formatDateandTime(dateTime)
                log("------------ Complete ------------");
                
                return IconButton(
                  color: AppColors.cFFFFFF,
                  icon: const Icon(
                    Icons.replay,
                  ),
                  iconSize: 24.0,
                  onPressed: () => player.seek(Duration.zero),
                );
              }
            },
          ),
        ),

        // Next button
        IconButton(
          icon: const Icon(Icons.skip_next, color: AppColors.allPrimaryColor),
          iconSize: 38.0,
          onPressed: () {
         
              final currentPosition = player.position;
                    final newPosition =
                        currentPosition+ const Duration(seconds: 10);
                    player.seek(newPosition < Duration.zero
                        ? Duration.zero
                        : newPosition);
            
          },
        ),
      ],
    );
  }
}

class PositionData {
  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;

  PositionData(this.position, this.bufferedPosition, this.duration);
}

class SeekBar extends StatelessWidget {
  final Duration duration;
  final Duration position;
  final Duration bufferedPosition;
  final ValueChanged<Duration> onChangeEnd;

  const SeekBar({
    required this.duration,
    required this.position,
    required this.bufferedPosition,
    required this.onChangeEnd,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final safePosition = position > duration ? duration : position;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
       
        UIHelper.verticalSpace(16.h),
        Slider(
          activeColor: AppColors.allPrimaryColor,
          inactiveColor: Colors.grey[300],
          min: 0.0,
          max: duration.inMilliseconds.toDouble(),
          value: safePosition.inMilliseconds.toDouble(),
          // onChanged: null,
          onChanged: (value) {
            log("=============== Come here when slider end ================${duration.inMicroseconds.toDouble()}");
            onChangeEnd(Duration(milliseconds: value.toInt()));
          },
        ),
         Padding(
           padding:  EdgeInsets.only(right: 25.sp),
           child: Text(
            position.toString().split('.').first,
                   ),
         ),
      ],
    );
  }
}

// void showSliderDialog({
//   required BuildContext context,
//   required String title,
//   required int divisions,
//   required double min,
//   required double max,
//   required double value,
//   required Stream<double> stream,
//   required ValueChanged<double> onChanged,
// }) {
//   showDialog<void>(
//     context: context,
//     builder: (context) => AlertDialog(
//       title: Text(title),
//       content: StreamBuilder<double>(
//         stream: stream,
//         builder: (context, snapshot) => Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(snapshot.data?.toStringAsFixed(1) ?? value.toStringAsFixed(1)),
//             Slider(
//               divisions: divisions,
//               min: min,
//               max: max,
//               value: snapshot.data ?? value,
//               onChanged: onChanged,
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }

