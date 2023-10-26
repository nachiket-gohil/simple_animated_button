import 'package:flutter/material.dart';

///
/// [ElevatedLayerButton] Renders Button layers in 3D perspective
///
class ElevatedLayerButton extends StatefulWidget {
  /// Define height for button
  final double? buttonHeight;

  /// Define width for button
  final double? buttonWidth;

  /// Define Clicking Duration - [Duration(milliseconds: 200)]
  final Duration? animationDuration;

  /// Define Animation Curve - [Curves.ease]
  final Curve? animationCurve;

  /// Void Function for Button click
  final VoidCallback? onClick;

  /// Define Base Layer [BoxDecoration] for button
  final BoxDecoration? baseDecoration;

  /// Define Top Layer [BoxDecoration] for button
  final BoxDecoration? topDecoration;

  /// Define Top Layer Child [Widget] for button
  final Widget? topLayerChild;

  const ElevatedLayerButton({
    Key? key,
    required this.buttonHeight,
    required this.buttonWidth,
    required this.animationDuration,
    required this.animationCurve,
    required this.onClick,
    this.baseDecoration,
    this.topDecoration,
    this.topLayerChild,
  }) : super(key: key);

  @override
  State<ElevatedLayerButton> createState() => _ElevatedLayerButtonState();
}

class _ElevatedLayerButtonState extends State<ElevatedLayerButton> {
  bool buttonPressed = false;

  bool get _enabled => widget.onClick != null;

  bool get _disabled => !_enabled;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _disabled ? 0.5 : 1,
      child: GestureDetector(
        onTap: () => setState(() => buttonPressed = true),
        child: SizedBox(
          height: widget.buttonHeight,
          width: widget.buttonWidth,
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: (widget.buttonWidth ?? 100) - 10,
                  height: (widget.buttonHeight ?? 40) - 10,
                  decoration: widget.baseDecoration ??
                      const BoxDecoration(
                        color: Colors.black,
                      ),
                ),
              ),
              AnimatedPositioned(
                bottom: buttonPressed ? 0 : 5,
                right: buttonPressed ? 0 : 5,
                duration: widget.animationDuration ??
                    const Duration(milliseconds: 300),
                curve: widget.animationCurve ?? Curves.ease,
                onEnd: () {
                  setState(() => buttonPressed = false);
                  if (_enabled) {
                    widget.onClick!();
                  }
                },
                child: Container(
                  width: (widget.buttonWidth ?? 100) - 10,
                  height: (widget.buttonHeight ?? 100) - 10,
                  alignment: Alignment.center,
                  decoration: widget.topDecoration ??
                      BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                  child: widget.topLayerChild,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
