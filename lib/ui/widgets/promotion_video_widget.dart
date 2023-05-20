import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/utils/extensions.dart';

class PromotionVideoWidget extends StatefulWidget {
  const PromotionVideoWidget({Key? key}) : super(key: key);

  @override
  State<PromotionVideoWidget> createState() => _PromotionVideoWidgetState();
}

class _PromotionVideoWidgetState extends State<PromotionVideoWidget> {
  late final BetterPlayerController _betterPlayerController;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _initBetterPlayerController();
    _initBetterPlayerListeners();
  }

  @override
  void dispose() {
    _betterPlayerController.dispose();
    _betterPlayerController.removeEventsListener(_playEventListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32.h,
      width: 100.w,
      child: Stack(
        children: [
          SizedBox(
            width: 100.w,
            child: BetterPlayer(
              controller: _betterPlayerController,
            ),
          ),
          AnimatedOpacity(
            opacity: _isPlaying ? 0 : 1,
            duration: const Duration(milliseconds: 500),
            child: ListTile(
              dense: true,
              leading: CircleAvatar(
                backgroundColor: Colors.brown[300],
                child: const Text('S'),
              ),
              title: Container(
                color: Colors.black.withOpacity(0.8),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Kheloo Productions',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0, right: 40),
                child: Container(
                  color: Colors.black.withOpacity(0.8),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Sam smith',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 10,
            top: 10,
            child: AnimatedOpacity(
              opacity: _isPlaying ? 0 : 1,
              duration: const Duration(milliseconds: 500),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.share,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _initBetterPlayerController() {
    _betterPlayerController = BetterPlayerController(
      const BetterPlayerConfiguration(
        aspectRatio: 16 / 12,
      ),
    );
    _betterPlayerController.setupDataSource(
      BetterPlayerDataSource.network(
        'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
        cacheConfiguration: const BetterPlayerCacheConfiguration(
          useCache: true,
        ),
      ),
    );
    _betterPlayerController.setBetterPlayerControlsConfiguration(
      const BetterPlayerControlsConfiguration(
        enableSkips: false,
        enableOverflowMenu: false,
        enableProgressBarDrag: false,
        enableProgressBar: false,
      ),
    );
  }

  _initBetterPlayerListeners() {
    _betterPlayerController.addEventsListener(_playEventListener);
  }

  _playEventListener(BetterPlayerEvent e) {
    if (e.betterPlayerEventType == BetterPlayerEventType.play) {
      setState(() {
        _isPlaying = true;
      });
    } else if (e.betterPlayerEventType == BetterPlayerEventType.pause) {
      setState(() {
        _isPlaying = false;
      });
    }
  }
}
