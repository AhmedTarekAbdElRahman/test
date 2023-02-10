import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  const Heart({super.key});

  @override
  HeartState createState() => HeartState();
}

class HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Color?> colorAnimation;
  late Animation<double?> sizeAnimation;
  late Animation curve;

  bool isFav = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    curve = CurvedAnimation(parent: controller, curve: Curves.slowMiddle);
    colorAnimation = ColorTween(begin: Colors.grey[400], end: Colors.red)
        .animate(curve as Animation<double>);
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        isFav = true;
      }
      if (status == AnimationStatus.dismissed) {
        isFav = false;
      }
    });
    sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem(
        tween: Tween(begin: 30, end: 50),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 50, end: 30),
        weight: 50,
      ),
    ]).animate(curve as Animation<double>);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return IconButton(
          icon: Icon(
            Icons.favorite,
            color: colorAnimation.value,
            size: sizeAnimation.value,
          ),
          onPressed: () {
            isFav ? controller.reverse() : controller.forward();
          },
        );
      },
    );
  }
}
