import 'package:flutter/material.dart';

class ElevatedLayerButton extends StatefulWidget {
  final VoidCallback onClick;
  final Duration? animationDuration;
  final Curve? animationCurve;
  final double? buttonHeight;
  final double? buttonWidth;
  final BoxDecoration? baseDecoration;
  final BoxDecoration? topDecoration;
  final Widget? topLayerChild;

  const ElevatedLayerButton({
    Key? key,
    required this.buttonHeight,
    required this.buttonWidth,
    required this.animationDuration,
    required this.animationCurve,
    required this.onClick,
    this.baseDecoration,
    this.topDecoration,
    this.topLayerChild,
  }) : super(key: key);

  @override
  State<ElevatedLayerButton> createState() => _ElevatedLayerButtonState();
}

class _ElevatedLayerButtonState extends State<ElevatedLayerButton> {
  bool buttonPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => buttonPressed = true),
      child: SizedBox(
        height: widget.buttonHeight,
        width: widget.buttonWidth,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                // base layer height width
                width: (widget.buttonWidth ?? 100) - 10,
                height: (widget.buttonHeight ?? 40) - 10,
                decoration: widget.baseDecoration ??
                    const BoxDecoration(
                      color: Colors.black,
                    ),
              ),
            ),
            AnimatedPositioned(
              bottom: buttonPressed ? 0 : 5,
              right: buttonPressed ? 0 : 5,
              duration: widget.animationDuration ?? const Duration(milliseconds: 300),
              curve: widget.animationCurve ?? Curves.ease,
              onEnd: () {
                setState(() => buttonPressed = false);
                widget.onClick;
              },
              child: Container(
                width: (widget.buttonWidth ?? 100) - 10,
                height: (widget.buttonHeight ?? 100) - 10,
                alignment: Alignment.center,
                decoration: widget.topDecoration ??
                    BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                child: widget.topLayerChild,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
