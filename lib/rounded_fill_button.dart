import 'package:flutter/material.dart';

///
/// [RoundedFillButton] Renders Rounded Filled Button
///
class RoundedFillButton extends StatefulWidget {
  /// Define width for button
  final double? buttonWidth;

  /// Define height for button
  final double? buttonHeight;

  /// Define Fill Color for Rounded button
  final Color? filledColor;

  /// Define Fill Radius for Rounded button
  final double? fillRadius;

  /// Void Function for Button click
  final VoidCallback? onClick;

  /// Define Filling Duration - [Duration(milliseconds: 600)]
  final Duration? fillingDuration;

  /// Define Animation Curve - [Curves.ease]
  final Curve? curve;

  /// Show Initial Round shape for Button
  final bool? showInitialShape;

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
    this.buttonDecoration,
    this.buttonPadding,
    this.buttonMargin,
    this.alignment,
    this.child,
  }) : super(key: key);

  @override
  State<RoundedFillButton> createState() => _RoundedFillButtonState();
}

class _RoundedFillButtonState extends State<RoundedFillButton> {
  bool buttonPressed = false;

  bool animationCompleted = true;

  bool get _enabled => widget.onClick != null;

  bool get _disabled => !_enabled;

  double? setFilledWidthAndShape() {
    double shapeWidth =
        (widget.showInitialShape ?? false) ? (widget.fillRadius ?? 30) : 0;
    return buttonPressed ? widget.buttonWidth : shapeWidth;
  }

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
          width: widget.buttonWidth ?? 100,
          height: widget.buttonHeight ?? 40,
          padding: widget.buttonPadding,
          margin: widget.buttonMargin,
          alignment: widget.alignment ?? Alignment.center,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              AnimatedContainer(
                duration:
                    widget.fillingDuration ?? const Duration(milliseconds: 500),
                width: setFilledWidthAndShape(),
                height: widget.buttonHeight ?? 40,
                curve: widget.curve ?? Curves.ease,
                onEnd: () {
                  if (!animationCompleted) {
                    animationCompleted = true;
                    setState(() => buttonPressed = false);
                    if (_enabled) {
                      widget.onClick!();
                    }
                  }
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
