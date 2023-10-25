import 'package:flutter/material.dart';

class TrailingButton extends StatefulWidget {
  final VoidCallback? onClick;
  final double? buttonWidth;
  final double? buttonHeight;
  final String? label;
  final Widget? trailing;
  final Duration? animationDuration;
  final double? trailingMovement;
  final Curve? curve;
  final TextStyle? labelStyle;
  final double? trailingGap;
  final EdgeInsetsGeometry? buttonMargin;

  const TrailingButton({
    Key? key,
    required this.label,
    required this.buttonWidth,
    required this.buttonHeight,
    required this.onClick,
    required this.animationDuration,
    required this.curve,
    this.labelStyle,
    this.trailing,
    this.trailingGap,
    this.trailingMovement,
    this.buttonMargin,
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
      width: widget.buttonWidth ?? 150,
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
                duration: widget.animationDuration ?? const Duration(milliseconds: 600),
                curve: widget.curve ?? Curves.ease,
                onEnd: () {
                  setState(() => buttonPressed = false);
                  widget.onClick;
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
