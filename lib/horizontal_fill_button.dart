import 'package:flutter/material.dart';

class HorizontalFillButton extends StatefulWidget {
  final Duration? fillingDuration;
  final Curve? curve;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? initialThickness;
  final VoidCallback? onClick;
  final Color? filledColor;
  final AlignmentGeometry? alignment;
  final BoxBorder? filledBorder;
  final double? cornerRadius;
  final EdgeInsetsGeometry? buttonPadding;
  final EdgeInsetsGeometry? buttonMargin;
  final Gradient? filledGradient;
  final Widget? child;

  const HorizontalFillButton({
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
  State<HorizontalFillButton> createState() => _HorizontalFillButtonState();
}

class _HorizontalFillButtonState extends State<HorizontalFillButton> {
  bool buttonPressed = false;
  bool get _enabled => widget.onClick != null;

  bool get _disabled => !_enabled;
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _disabled ? 0.5 : 1.0,
      child: GestureDetector(
        onTap: () => setState(() => buttonPressed = true),
        child: Container(
          width: widget.buttonWidth ?? 100,
          height: widget.buttonHeight ?? 40,
          alignment: widget.alignment ?? Alignment.center,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              AnimatedContainer(
                duration: widget.fillingDuration ?? const Duration(milliseconds: 600),
                curve: widget.curve ?? Curves.easeIn,
                width: buttonPressed ? widget.buttonWidth : widget.initialThickness ?? 0,
                height: widget.buttonHeight ?? 40,
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
                height: widget.buttonHeight ?? 40,
                alignment: widget.alignment ?? Alignment.center,
                child: widget.child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
