import 'package:flutter/material.dart';

class BouncingButton extends StatefulWidget {
  final Duration? bouncingDuration;
  final Curve? curve;
  final double buttonWidth;
  final double? buttonBouncingWidth;
  final double? buttonHeight;
  final Decoration? buttonDecoration;
  final Widget? child;
  final VoidCallback? onClick;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? buttonPadding;
  final EdgeInsetsGeometry? buttonMargin;

  const BouncingButton({
    Key? key,
    required this.buttonWidth,
    required this.buttonHeight,
    required this.onClick,
    required this.bouncingDuration,
    required this.curve,
    this.buttonBouncingWidth,
    this.buttonMargin,
    this.buttonPadding,
    this.alignment,
    this.buttonDecoration,
    this.child,
  }) : super(key: key);

  @override
  State<BouncingButton> createState() => _BouncingButtonState();
}

class _BouncingButtonState extends State<BouncingButton> {
  bool bouncing = false;
  bool get _enabled => widget.onClick != null;

  bool get _disabled => !_enabled;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _disabled ? 0.5 : 1,
      child: GestureDetector(
        onTap: () => setState(() => bouncing = true),
        child: AnimatedContainer(
          duration: widget.bouncingDuration ?? const Duration(milliseconds: 200),
          curve: widget.curve ?? Curves.easeOut,
          width: bouncing
              ? widget.buttonWidth
              : widget.buttonWidth + (widget.buttonBouncingWidth ?? 20),
          onEnd: () {
            setState(() => bouncing = false);
            widget.onClick;
          },
          child: Container(
            height: widget.buttonHeight ?? 40,
            width: bouncing
                ? widget.buttonWidth
                : widget.buttonWidth + (widget.buttonBouncingWidth ?? 20),
            alignment: widget.alignment ?? Alignment.center,
            padding: widget.buttonPadding,
            margin: widget.buttonMargin,
            decoration: widget.buttonDecoration ??
                BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(8),
                ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
