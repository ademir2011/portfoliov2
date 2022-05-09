import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoTemplateWidget extends StatefulWidget {
  final double width;
  final double height;
  final String? urlVideo;

  const VideoTemplateWidget({
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
        ..initialize().then((_) => setState(() => {}));
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
                    : Text('video carregado.'),
              ),
            ],
          );
  }
}
