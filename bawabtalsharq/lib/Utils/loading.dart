import 'dart:math';

import "package:flutter/material.dart";

import 'images.dart';

class LoadingLogo extends StatefulWidget {
  final double radius;
  final double dotRadius;

  LoadingLogo({this.radius = 30.0, this.dotRadius = 7.0});

  @override
  _LoadingLogoState createState() => _LoadingLogoState();
}

class _LoadingLogoState extends State<LoadingLogo>
    with SingleTickerProviderStateMixin {
  Animation<double> animation_rotation;
  Animation<double> animation_radius_in;
  Animation<double> animation_radius_out;
  AnimationController controller;

  double radius;
  double dotRadius;

  @override
  void initState() {
    super.initState();

    radius = widget.radius;
    dotRadius = widget.dotRadius;

    print(dotRadius);

    controller = AnimationController(
        lowerBound: 0.0,
        upperBound: 1.0,
        duration: const Duration(milliseconds: 3000),
        vsync: this);

    animation_rotation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 1.0, curve: Curves.linear),
      ),
    );

    animation_radius_in = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.75, 1.0, curve: Curves.elasticIn),
      ),
    );

    animation_radius_out = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.25, curve: Curves.elasticOut),
      ),
    );

    controller.addListener(() {
      setState(() {
        if (controller.value >= 0.75 && controller.value <= 1.0)
          radius = widget.radius * animation_radius_in.value;
        else if (controller.value >= 0.0 && controller.value <= 0.25)
          radius = widget.radius * animation_radius_out.value;
      });
    });

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {}
    });

    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 100.0,
          height: 100.0,
          //color: Colors.black12,
          child: new Column(
            children: [
              SizedBox(
                child: new Transform.translate(
                    offset: Offset(0, 25),
                    child: Image(
                      image: AssetImage(logo),
                    )),
                height: 40,
                width: 40,
              ),
              new RotationTransition(
                turns: animation_rotation,
                child: new Container(
                  //color: Colors.limeAccent,
                  child: new Center(
                    child: Stack(
                      children: <Widget>[
                        new Transform.translate(
                          child: Dot(
                            radius: dotRadius,
                            color: Colors.lightGreen,
                          ),
                          offset: Offset(
                            radius * cos(0.0),
                            radius * sin(0.0),
                          ),
                        ),
                        transform(Colors.orange, 1),
                        transform(Colors.black, 2),
                        transform(Colors.lightGreen, 3),
                        transform(Colors.orange, 4),
                        transform(Colors.black, 5),
                        transform(Colors.lightGreen, 6),
                        transform(Colors.orange, 7)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget transform(Color colors, int num) {
    return Transform.translate(
      child: Dot(
        radius: dotRadius,
        color: colors,
      ),
      offset: Offset(
        radius * cos(0.0 + num * pi / 4),
        radius * sin(0.0 + num * pi / 4),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class Dot extends StatelessWidget {
  final double radius;
  final Color color;

  Dot({this.radius, this.color});

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
