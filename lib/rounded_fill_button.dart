import 'package:flutter/material.dart';

class RoundedFillButton extends StatefulWidget {
  final Duration? fillingDuration;
  final Curve? curve;
  final double? buttonWidth;
  final double? buttonHeight;
  final VoidCallback onClick;
  final Color? filledColor;
  final AlignmentGeometry? alignment;
  final BoxBorder? filledBorder;
  final double? fillRadius;
  final EdgeInsetsGeometry? buttonPadding;
  final EdgeInsetsGeometry? buttonMargin;
  final Gradient? filledGradient;
  final Widget? child;
  final bool? showInitialShape;

  const RoundedFillButton({
    Key? key,
    required this.buttonWidth,
    required this.buttonHeight,
    required this.filledColor,
    required this.fillRadius,
    required this.onClick,
    required this.fillingDuration,
    required this.curve,
    this.showInitialShape,
    this.filledBorder,
    this.filledGradient,
    this.buttonMargin,
    this.buttonPadding,
    this.alignment,
    this.child,
  }) : super(key: key);

  @override
  State<RoundedFillButton> createState() => _RoundedFillButtonState();
}

class _RoundedFillButtonState extends State<RoundedFillButton> {
  bool buttonPressed = false;
  double? setFilledWidthAndShape() {
    double shapeWidth = (widget.showInitialShape ?? false) ? (widget.fillRadius ?? 30) : 0;
    return buttonPressed ? widget.buttonWidth : shapeWidth;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => buttonPressed = true),
      child: Container(
        width: widget.buttonWidth ?? 100,
        height: widget.buttonHeight ?? 40,
        padding: widget.buttonPadding,
        margin: widget.buttonMargin,
        alignment: widget.alignment ?? Alignment.center,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            AnimatedContainer(
              duration: widget.fillingDuration ?? const Duration(milliseconds: 500),
              width: setFilledWidthAndShape(),
              height: widget.buttonHeight ?? 40,
              curve: widget.curve ?? Curves.ease,
              onEnd: () {
                setState(() => buttonPressed = false);
                widget.onClick;
              },
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.fillRadius ?? 30),
                color: widget.filledColor ?? Colors.amber,
                border: widget.filledBorder,
                gradient: widget.filledGradient,
              ),
            ),
            Container(
              height: widget.buttonHeight ?? 40,
              alignment: widget.alignment ?? Alignment.center,
              child: widget.child,
            ),
          ],
        ),
      ),
    );
  }
}
