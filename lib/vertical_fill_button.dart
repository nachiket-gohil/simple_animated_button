import 'package:flutter/material.dart';

class VerticalFillButton extends StatefulWidget {
  final Duration? fillingDuration;
  final Curve? curve;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? initialThickness;
  final VoidCallback onClick;
  final Color? filledColor;
  final AlignmentGeometry? alignment;
  final BoxBorder? filledBorder;
  final double? cornerRadius;
  final EdgeInsetsGeometry? buttonPadding;
  final EdgeInsetsGeometry? buttonMargin;
  final Gradient? filledGradient;
  final Widget? child;

  const VerticalFillButton({
    Key? key,
    required this.buttonWidth,
    required this.buttonHeight,
    required this.filledColor,
    required this.onClick,
    required this.fillingDuration,
    required this.curve,
    this.initialThickness,
    this.cornerRadius,
    this.filledBorder,
    this.filledGradient,
    this.buttonMargin,
    this.buttonPadding,
    this.alignment,
    this.child,
  }) : super(key: key);

  @override
  State<VerticalFillButton> createState() => _VerticalFillButtonState();
}

class _VerticalFillButtonState extends State<VerticalFillButton> {
  bool buttonPressed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => buttonPressed = true),
      child: Container(
        width: widget.buttonWidth ?? 80,
        height: widget.buttonHeight ?? 50,
        alignment: widget.alignment ?? Alignment.center,
        padding: widget.buttonPadding,
        margin: widget.buttonMargin,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            AnimatedContainer(
              duration: widget.fillingDuration ?? const Duration(milliseconds: 600),
              width: widget.buttonWidth ?? 80,
              height: buttonPressed ? (widget.buttonHeight ?? 50) : (widget.initialThickness ?? 0),
              curve: widget.curve ?? Curves.ease,
              decoration: BoxDecoration(
                color: widget.filledColor ?? Colors.amber,
                borderRadius: BorderRadius.circular(widget.cornerRadius ?? 0),
                border: widget.filledBorder,
                gradient: widget.filledGradient,
              ),
              onEnd: () {
                setState(() => buttonPressed = false);
                widget.onClick;
              },
            ),
            Container(
              height: widget.buttonHeight ?? 50,
              width: widget.buttonWidth ?? 80,
              alignment: widget.alignment ?? Alignment.center,
              child: widget.child,
            ),
          ],
        ),
      ),
    );
  }
}
