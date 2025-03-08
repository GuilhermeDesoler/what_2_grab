import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    required this.width,
    required this.text,
    required this.textColor,
    required this.bgColor,
    this.shape = ButtonShape.semiRounded,
    this.size = ButtonSize.meddium,
    this.prefix,
    this.suffix,
    this.disabled = false,
    this.loading = false,
    this.border = false,
    this.borderColor,
    this.onPress,
    super.key,
  })  : assert(width > 0, 'Please provide a valid width!'),
        assert(!disabled || onPress != null,
            'onPress must be provided unless the button is disabled.');

  final double width;
  final String text;
  final Color textColor;
  final Color bgColor;
  final ButtonShape shape;
  final ButtonSize size;
  final IconData? prefix;
  final IconData? suffix;
  final bool disabled;
  final bool loading;
  final bool border;
  final Color? borderColor;
  final dynamic Function()? onPress;

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

  bool get isDisabled =>
      widget.disabled || widget.onPress == null || isLoading || widget.loading;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.shape.radius),
        child: Material(
          elevation: 8,
          child: GestureDetector(
            onTapDown: (_) => setState(() => isPressed = true),
            onTapUp: (_) => setState(() => isPressed = false),
            onTapCancel: () => setState(() => isPressed = false),
            onTap: isDisabled ? null : _onAction,
            child: AnimatedContainer(
              width: widget.width,
              height: widget.size.height,
              curve: Curves.easeOut,
              duration: Duration(milliseconds: 200),
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
              child: _buttonContent(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _iconContent(IconData icon) {
    return Icon(
      icon,
      color: _textColor,
      size: widget.size.fontSize,
    );
  }

  Widget _buttonContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isLoading || widget.loading) ...[
          SizedBox(
            width: widget.size.fontSize,
            height: widget.size.fontSize,
            child: CircularProgressIndicator(
              color: widget.textColor,
            ),
          )
        ] else ...[
          if (widget.prefix != null) ...[
            _iconContent(widget.prefix!),
            const SizedBox(width: 8),
          ],
          Text(
            widget.text,
            style: TextStyle(
              color: _textColor,
              fontSize: widget.size.fontSize,
            ),
          ),
          if (widget.suffix != null) ...[
            const SizedBox(width: 8),
            _iconContent(widget.suffix!),
          ],
        ],
      ],
    );
  }

  Color get _textColor {
    if (isDisabled) return Colors.grey[600]!;
    return widget.textColor;
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
  semiRounded(10),
  squared(0);

  const ButtonShape(this.radius);

  final double radius;
}

enum ButtonSize {
  small(12, 12, 4, 32),
  meddium(14, 14, 6, 38),
  big(16, 16, 8, 44);

  const ButtonSize(
    this.fontSize,
    this.horizontalPadding,
    this.verticalPadding,
    this.height,
  );

  final double fontSize;
  final double horizontalPadding;
  final double verticalPadding;
  final double height;
}
