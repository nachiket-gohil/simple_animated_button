import 'package:flutter/material.dart';

///
/// [TrailingButton] Renders Trailing Button
///
class TrailingButton extends StatefulWidget {
  /// Define width for button
  final double? buttonWidth;

  /// Define height for button
  final double? buttonHeight;

  /// Define Label for button
  final String? label;

  /// Define Trailing Icon for button
  final Widget? trailing;

  /// Void Function for Button click
  final VoidCallback? onClick;

  /// Define Filling Duration - [Duration(milliseconds: 600)]
  final Duration? animationDuration;

  /// Define Animation Curve - [Curves.ease]
  final Curve? curve;

  /// Define Label Style for button
  final TextStyle? labelStyle;

  /// Define Gap between Label and Trailing Icon
  final double? trailingGap;

  /// Define Margin for button
  final EdgeInsetsGeometry? buttonMargin;

  /// Define Movement Value for button - eg. 10
  final double? trailingMovement;

  const TrailingButton({
    Key? key,
    required this.buttonWidth,
    required this.buttonHeight,
    required this.label,
    required this.trailing,
    required this.onClick,
    required this.animationDuration,
    required this.curve,
    this.labelStyle,
    this.trailingGap,
    this.buttonMargin,
    this.trailingMovement,
  }) : super(key: key);

  @override
  State<TrailingButton> createState() => _TrailingButtonState();
}

class _TrailingButtonState extends State<TrailingButton> {
  bool buttonPressed = false;

  bool get _enabled => widget.onClick != null;

  bool get _disabled => !_enabled;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: (widget.buttonWidth ?? 150) +
          (widget.trailingGap ?? 4) +
          (widget.trailingMovement ?? 8),
      height: widget.buttonHeight ?? 40,
      alignment: Alignment.center,
      margin: widget.buttonMargin,
      child: Opacity(
        opacity: _disabled ? 0.5 : 1,
        child: GestureDetector(
          onTap: () => setState(() => buttonPressed = true),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.label ?? "Trailing Button",
                style: widget.labelStyle,
              ),
              SizedBox(width: widget.trailingGap ?? 4),
              AnimatedPadding(
                padding: EdgeInsets.only(
                  left: buttonPressed ? (widget.trailingMovement ?? 8) : 0,
                ),
                duration: widget.animationDuration ??
                    const Duration(milliseconds: 600),
                curve: widget.curve ?? Curves.ease,
                onEnd: () {
                  setState(() => buttonPressed = false);
                  if (_enabled) {
                    widget.onClick!();
                  }
                },
                child: widget.trailing ??
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: (widget.buttonHeight ?? 40) - 10,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
