import 'package:flutter/material.dart';
import 'package:portfoliov2/shared/widgets/icon_link_widget.dart';
import 'package:video_player/video_player.dart';
import 'dart:html' as html;

class VideoTemplateWidget extends StatefulWidget {
  double width;
  double height;
  final String? urlVideo;

  VideoTemplateWidget({
    Key? key,
    this.width = 300,
    this.height = 450,
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
        : Column(
            children: [
              SizedBox(
                width: widget.width,
                height: widget.height,
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
              const SizedBox(height: 25),
              Row(
                children: [
                  IconLinkWidget(
                    pathAssetIcon: 'lib\\assets\\icons\\stop.png',
                    color: Theme.of(context).colorScheme.primary,
                    onPressed: () {
                      videoPlayerController!.pause();
                      videoPlayerController!.seekTo(const Duration(seconds: 0));
                      setState(() {});
                    },
                  ),
                  const SizedBox(width: 25),
                  IconLinkWidget(
                    pathAssetIcon: videoPlayerController!.value.isPlaying
                        ? 'lib\\assets\\icons\\pause.png'
                        : 'lib\\assets\\icons\\play.png',
                    color: Theme.of(context).colorScheme.primary,
                    onPressed: () {
                      if (videoPlayerController!.value.isPlaying) {
                        videoPlayerController!.pause();
                      } else {
                        videoPlayerController!.play();
                      }

                      setState(() {});
                    },
                  ),
                  // const SizedBox(width: 25),
                  // IconLinkWidget(
                  //   pathAssetIcon: 'lib\\assets\\icons\\fullscreen.png',
                  //   color: Theme.of(context).colorScheme.primary,
                  //   onPressed: () {
                  //     showDialog(
                  //       context: context,
                  //       builder: (ctx) {
                  //         html.document.documentElement!.requestFullscreen();
                  //         return Container(
                  //           color: Colors.blue,
                  //         );
                  //       },
                  //     );
                  //   },
                  // ),
                ],
              )
            ],
          );
  }
}
