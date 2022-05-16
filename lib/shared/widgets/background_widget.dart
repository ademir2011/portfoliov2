import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class BackgroundWidget extends StatefulWidget {
  const BackgroundWidget({Key? key}) : super(key: key);

  @override
  State<BackgroundWidget> createState() => _BackgroundWidgetState();
}

class _BackgroundWidgetState extends State<BackgroundWidget> with TickerProviderStateMixin {
  final amountCircles = 40;
  final minCircleSize = 10;
  final maxCircleSize = 50;
  final minSecSpeed = 3;
  final maxSecSpeed = 10;
  var valuesX = <double>[];
  var valuesY = <double>[];
  var sizesCircle = <double>[];
  var colors = const [
    Color(0xFFDD517F),
    Color(0xFFE68E36),
    Color(0xFF556DC8),
    Color(0xFFF7E752),
    Color(0xFFff2975),
    Color(0xFF8c1eff),
  ];

  final _doubleTween = Tween<double>(begin: 0, end: 1100);
  List<Animation<double>?> animation = [];
  List<AnimationController?> animationController = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final size = MediaQuery.of(context).size;

      valuesX = List.generate(amountCircles, (index) => Random().nextDouble() * size.width);
      valuesY = List.generate(amountCircles, (index) => Random().nextDouble() * size.height);
      colors = List.generate(amountCircles, (index) => colors[Random().nextInt(colors.length)]);

      sizesCircle = List.generate(
        amountCircles,
        (index) => (Random().nextInt(maxCircleSize) + minCircleSize).toDouble(),
      );

      for (var i = 0; i < amountCircles; i++) {
        animationController.add(AnimationController(
          vsync: this,
          duration: Duration(seconds: Random().nextInt(maxSecSpeed) + minSecSpeed),
        ));

        animation.add(_doubleTween.animate(animationController[i]!)
          ..addListener(() => setState(() => {}))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              animationController[i]!.reverse();
            } else if (status == AnimationStatus.dismissed) {
              animationController[i]!.forward();
            }
          }));
        animationController[i]!.forward();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    for (var i = 0; i < amountCircles; i++) {
      animationController[i]!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        animation.isNotEmpty && animation.length == amountCircles
            ? CustomPaint(
                painter: BackgroundPainter(
                  valuesX: valuesX,
                  valuesY: valuesY,
                  sizesCircle: sizesCircle,
                  colors: colors,
                  valuesTicker: List.generate(animation.length, (index) => animation[index]!.value).toList(),
                ),
                child: Container(),
              )
            : Container(),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor.withOpacity(.3),
            ),
          ),
        ),
      ],
    );
  }
}

class BackgroundPainter extends CustomPainter {
  var valuesX = <double>[];
  var valuesY = <double>[];
  var sizesCircle = <double>[];
  var colors = [];
  List<double> valuesTicker;

  BackgroundPainter({
    required this.valuesX,
    required this.valuesY,
    required this.sizesCircle,
    required this.colors,
    required this.valuesTicker,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    if ((valuesX.length == valuesY.length) &&
        (valuesX.length == sizesCircle.length) &&
        (valuesX.length == colors.length)) {
      for (var i = 0; i < valuesX.length; i++) {
        paint.color = colors[i];
        canvas.drawCircle(Offset(valuesX[i], valuesY[i]), (valuesTicker[i] / 15) + sizesCircle[i], paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
