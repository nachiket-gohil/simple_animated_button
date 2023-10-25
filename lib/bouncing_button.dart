import 'package:flutter/material.dart';

///
/// [BouncingButton] Renders Bouncing Button
///
class BouncingButton extends StatefulWidget {
  /// Define width for button
  final double? buttonWidth;

  /// Define height for button
  final double? buttonHeight;

  /// Define Clicking Duration - [Duration(milliseconds: 200)]
  final Duration? bouncingDuration;

  /// Define Animation Curve - [Curves.ease]
  final Curve? curve;

  /// Void Function for Button click
  final VoidCallback? onClick;

  /// Define only Bouncing width for button - eg. 10-50
  final double? buttonBouncingWidth;

  /// Define [BoxDecoration] for button
  final Decoration? buttonDecoration;

  /// Define Button [Margin]
  final EdgeInsetsGeometry? buttonMargin;

  /// Define Button [Padding]
  final EdgeInsetsGeometry? buttonPadding;

  /// Child Alignment in Button
  final AlignmentGeometry? alignment;

  /// Define Child [Widget] for button
  final Widget? child;

  const BouncingButton({
    Key? key,
    required this.buttonWidth,
    required this.buttonHeight,
    required this.bouncingDuration,
    required this.curve,
    required this.onClick,
    this.buttonBouncingWidth,
    this.buttonDecoration,
    this.buttonMargin,
    this.buttonPadding,
    this.alignment,
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
              ? widget.buttonWidth ?? 80
              : widget.buttonWidth ?? 80 + (widget.buttonBouncingWidth ?? 20),
          onEnd: () {
            setState(() => bouncing = false);
            widget.onClick;
          },
          child: Container(
            height: widget.buttonHeight ?? 40,
            width: bouncing
                ? widget.buttonWidth
                : widget.buttonWidth ?? 80 + (widget.buttonBouncingWidth ?? 20),
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
