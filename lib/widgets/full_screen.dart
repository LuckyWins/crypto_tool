import 'package:flutter/material.dart';

class FullScreen extends StatelessWidget {
  final Key key;
  final bool leftSafe;
  final bool topSafe;
  final bool rightSafe;
  final bool bottomSafe;
  final Widget child;
  final ScrollController controller;

  const FullScreen({
    this.key,
    this.leftSafe = true,
    this.topSafe = true,
    this.rightSafe = true,
    this.bottomSafe = true,
    @required this.child,
    this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      left: leftSafe,
      top: topSafe,
      right: rightSafe,
      bottom: bottomSafe,
      child: LayoutBuilder(
        builder: (context, viewportConstraints) {
          return Scrollbar(
            child: SingleChildScrollView(
              controller: controller,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight
                ),
                child: child,
              ),
            ),
          );
        },
      ),
    );
  }
}