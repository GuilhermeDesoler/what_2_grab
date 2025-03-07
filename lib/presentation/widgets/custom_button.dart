import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    required this.text,
    required this.textColor,
    required this.bgColor,
    this.shape = ButtonShape.semiRounded,
    this.size = ButtonSize.meddium,
    this.disabled = false,
    this.border = false,
    this.borderColor,
    this.onPress,
    super.key,
  });

  final String text;
  final Color textColor;
  final Color bgColor;
  final ButtonShape shape;
  final ButtonSize size;
  final bool disabled;
  final bool border;
  final Color? borderColor;
  final Future<void> Function()? onPress;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isLoading = false;
  bool isHovered = false;
  bool isPressed = false;

  Future<void> _onAction() async {
    if (widget.onPress == null) {
      return;
    }

    try {
      if (mounted) {
        setState(() {
          isLoading = true;
        });
      }
      await widget.onPress!();
    } catch (e) {
      debugPrint('Function call error!');
    }

    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  bool get isDisabled => widget.disabled || widget.onPress == null || isLoading;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => isPressed = true),
        onTapUp: (_) => setState(() => isPressed = false),
        onTapCancel: () => setState(() => isPressed = false),
        onTap: isDisabled ? null : _onAction,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(widget.shape.radius),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            curve: Curves.easeOut,
            transform: Matrix4.translationValues(0, isPressed ? 2 : 0, 0),
            padding: EdgeInsets.symmetric(
              horizontal: widget.size.horizontalPadding,
              vertical: widget.size.verticalPadding,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.shape.radius),
              border: widget.border
                  ? Border.all(
                      width: 1,
                      color: isDisabled
                          ? Colors.grey[500]!
                          : (widget.borderColor ?? Colors.black),
                    )
                  : null,
              color: _bgColor,
              boxShadow: _shadow,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(width: 8),
                _buttonContent(),
                const SizedBox(width: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttonContent() {
    return isLoading
        ? SizedBox(
            width: widget.size.fontSize,
            height: widget.size.fontSize,
            child: CircularProgressIndicator(
              color: widget.textColor,
            ),
          )
        : Text(
            widget.text,
            style: TextStyle(
              color: isDisabled ? Colors.grey[600] : widget.textColor,
              fontSize: widget.size.fontSize,
            ),
          );
  }

  Color get _bgColor {
    if (isDisabled) return Colors.grey[300]!;
    return widget.bgColor;
  }

  List<BoxShadow>? get _shadow {
    if (isDisabled) return null;
    return [
      BoxShadow(
        color: Colors.black.withValues(alpha: isHovered ? 0.2 : 0.1),
        offset: Offset(0, isPressed ? 1 : (isHovered ? 6 : 2)),
        blurRadius: isPressed ? 2 : (isHovered ? 8 : 4),
      ),
    ];
  }
}

enum ButtonShape {
  rounded(50),
  semiRounded(12),
  squared(0);

  const ButtonShape(this.radius);

  final double radius;
}

enum ButtonSize {
  small(12, 12, 4),
  meddium(14, 14, 6),
  big(16, 16, 8);

  const ButtonSize(
    this.fontSize,
    this.horizontalPadding,
    this.verticalPadding,
  );

  final double fontSize;
  final double horizontalPadding;
  final double verticalPadding;
}
