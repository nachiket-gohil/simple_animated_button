import 'package:flutter/material.dart';

///
/// [VerticalFillButton] Renders Vertically Filled Button
///
class VerticalFillButton extends StatefulWidget {
  /// Define width for button
  final double? buttonWidth;

  /// Define height for button
  final double? buttonHeight;

  /// Define Fill Color for Vertical bar
  final Color? filledColor;

  /// Define Filling Duration - [Duration(milliseconds: 600)]
  final Duration? fillingDuration;

  /// Define Animation Curve - [Curves.ease]
  final Curve? curve;

  /// Void Function for Button click
  final VoidCallback? onClick;

  /// Define Initial Thickness - eg. 10
  final double? initialThickness;

  /// Define Corner Radius for Fill - eg. 20
  final double? cornerRadius;

  /// Define Fill Border
  final BoxBorder? filledBorder;

  /// Define Fill Gradient
  final Gradient? filledGradient;

  /// Define Actual Button Decoration
  final BoxDecoration? buttonDecoration;

  /// Define Button Padding
  final EdgeInsetsGeometry? buttonPadding;

  /// Define Button Margin
  final EdgeInsetsGeometry? buttonMargin;

  /// Define Button Alignment
  final AlignmentGeometry? alignment;

  /// Define Child [Widget] for button
  final Widget? child;

  const VerticalFillButton({
    Key? key,
    required this.buttonWidth,
    required this.buttonHeight,
    required this.filledColor,
    required this.fillingDuration,
    required this.curve,
    required this.onClick,
    this.initialThickness,
    this.cornerRadius,
    this.filledBorder,
    this.filledGradient,
    this.buttonDecoration,
    this.buttonPadding,
    this.buttonMargin,
    this.alignment,
    this.child,
  }) : super(key: key);

  @override
  State<VerticalFillButton> createState() => _VerticalFillButtonState();
}

class _VerticalFillButtonState extends State<VerticalFillButton> {
  bool buttonPressed = false;

  bool animationCompleted = true;

  bool get _enabled => widget.onClick != null;

  bool get _disabled => !_enabled;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _disabled ? 0.5 : 1,
      child: GestureDetector(
        onTap: () {
          setState(() {
            buttonPressed = true;
            animationCompleted = false;
          });
        },
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
                duration:
                    widget.fillingDuration ?? const Duration(milliseconds: 600),
                width: widget.buttonWidth ?? 80,
                height: buttonPressed
                    ? (widget.buttonHeight ?? 50)
                    : (widget.initialThickness ?? 0),
                curve: widget.curve ?? Curves.ease,
                decoration: BoxDecoration(
                  color: widget.filledColor ?? Colors.amber,
                  borderRadius: BorderRadius.circular(widget.cornerRadius ?? 0),
                  border: widget.filledBorder,
                  gradient: widget.filledGradient,
                ),
                onEnd: () {
                  if (!animationCompleted) {
                    animationCompleted = true;
                    setState(() => buttonPressed = false);
                    if (_enabled) {
                      widget.onClick!();
                    }
                  }
                },
              ),
              Container(
                height: widget.buttonHeight ?? 50,
                width: widget.buttonWidth ?? 80,
                alignment: widget.alignment ?? Alignment.center,
                decoration: widget.buttonDecoration ??
                    const BoxDecoration(
                      color: Colors.white,
                    ),
                child: widget.child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
