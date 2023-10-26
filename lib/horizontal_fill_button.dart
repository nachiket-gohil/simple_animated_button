import 'package:flutter/material.dart';

///
/// [HorizontalFillButton] Renders Horizontally Filled Button
///
class HorizontalFillButton extends StatefulWidget {
  /// Define width for button
  final double? buttonWidth;

  /// Define height for button
  final double? buttonHeight;

  /// Define Fill Color for Horizontal bar
  final Color? filledColor;

  /// Define Filling Duration - [Duration(milliseconds: 600)]
  final Duration? fillingDuration;

  /// Define Animation Curve - [Curves.ease]
  final Curve? curve;

  /// Void Function for Button click
  final VoidCallback? onClick;

  /// Define Initial Thickness - eg. 20
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

  const HorizontalFillButton({
    Key? key,
    required this.buttonWidth,
    required this.buttonHeight,
    required this.filledColor,
    required this.fillingDuration,
    required this.curve,
    required this.onClick,
    this.buttonDecoration,
    this.initialThickness,
    this.cornerRadius,
    this.filledBorder,
    this.filledGradient,
    this.buttonPadding,
    this.buttonMargin,
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
          padding: widget.buttonPadding,
          margin: widget.buttonMargin,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              AnimatedContainer(
                duration:
                    widget.fillingDuration ?? const Duration(milliseconds: 600),
                curve: widget.curve ?? Curves.easeIn,
                width: buttonPressed
                    ? widget.buttonWidth ?? 100
                    : widget.initialThickness ?? 0,
                height: widget.buttonHeight ?? 40,
                decoration: BoxDecoration(
                  color: widget.filledColor ?? Colors.amber,
                  borderRadius: BorderRadius.circular(widget.cornerRadius ?? 0),
                  border: widget.filledBorder,
                  gradient: widget.filledGradient,
                ),
                onEnd: () {
                  setState(() => buttonPressed = false);
                  if (_enabled) {
                    widget.onClick!();
                  }
                },
              ),
              Container(
                height: widget.buttonHeight ?? 40,
                width: widget.buttonWidth ?? 100,
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
