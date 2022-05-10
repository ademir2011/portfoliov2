import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoTemplateWidget extends StatefulWidget {
  double width;
  double height;
  final String? urlVideo;

  VideoTemplateWidget({
    Key? key,
    this.width = 300,
    this.height = 600,
    this.urlVideo,
  }) : super(key: key);

  @override
  State<VideoTemplateWidget> createState() => _VideoTemplateWidgetState();
}

class _VideoTemplateWidgetState extends State<VideoTemplateWidget> {
  VideoPlayerController? videoPlayerController;

  @override
  void initState() {
    super.initState();
    if (widget.urlVideo != null) {
      videoPlayerController = VideoPlayerController.network(widget.urlVideo!)
        ..initialize().then((_) => setState(() {
              if (videoPlayerController!.value.aspectRatio > 1) {
                final temp = widget.width;
                widget.width = widget.height * 1.5;
                widget.height = temp * 1.5;
              }
            }));
      videoPlayerController!.addListener(() => setState(() => {}));
      videoPlayerController!.setVolume(0);
      videoPlayerController!.play();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    if (videoPlayerController != null) {
      videoPlayerController!.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.urlVideo == null
        ? Container()
        : Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: widget.width,
                height: widget.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.secondary,
                      Theme.of(context).colorScheme.tertiary,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.secondary,
                      blurRadius: 10,
                    ),
                    BoxShadow(
                      color: Theme.of(context).colorScheme.tertiary,
                      blurRadius: 5,
                    ),
                  ],
                ),
              ),
              Container(
                width: widget.width - 2.5,
                height: widget.height - 2.5,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.tertiary.withOpacity(.5),
                    ),
                    BoxShadow(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      blurRadius: 10,
                      spreadRadius: -2,
                    ),
                  ],
                ),
                child: videoPlayerController == null
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : SizedBox(
                        height: widget.height - 50,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            VideoPlayer(videoPlayerController!),
                            Container(
                              height: 10,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(.5),
                              ),
                              child: VideoProgressIndicator(videoPlayerController!, allowScrubbing: true),
                            ),
                          ],
                        ),
                      ),
              ),
            ],
          );
  }
}
