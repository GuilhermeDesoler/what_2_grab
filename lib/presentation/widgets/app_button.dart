import 'package:flutter/material.dart';
import 'package:what_2_grab/presentation/widgets/main.dart';

class AppButton extends CustomButton {
  const AppButton({
    required super.width,
    required super.text,
    required super.textColor,
    required super.bgColor,
    super.shape,
    super.size,
    super.prefix,
    super.suffix,
    super.disabled,
    super.loading,
    super.border,
    super.borderColor,
    super.onPress,
    super.key,
  });

  factory AppButton.primary({
    required AppButtonDto dto,
    required BuildContext context,
  }) {
    final theme = Theme.of(context).colorScheme;

    return AppButton(
      width: dto.width,
      text: dto.text,
      textColor: theme.onPrimary,
      bgColor: theme.primary,
      shape: dto.shape,
      size: dto.size,
      prefix: dto.prefix,
      suffix: dto.suffix,
      disabled: dto.disabled,
      loading: dto.loading,
      border: true,
      borderColor: theme.onPrimary,
      onPress: dto.onPress,
    );
  }

  factory AppButton.secondary({
    required AppButtonDto dto,
    required BuildContext context,
  }) {
    final theme = Theme.of(context).colorScheme;

    return AppButton(
      width: dto.width,
      text: dto.text,
      textColor: theme.onSecondary,
      bgColor: theme.secondary,
      shape: dto.shape,
      size: dto.size,
      prefix: dto.prefix,
      suffix: dto.suffix,
      disabled: dto.disabled,
      loading: dto.loading,
      border: true,
      borderColor: theme.onSecondary,
      onPress: dto.onPress,
    );
  }

  factory AppButton.outlined({
    required AppButtonDto dto,
    required BuildContext context,
  }) {
    final theme = Theme.of(context).colorScheme;

    return AppButton(
      width: dto.width,
      text: dto.text,
      textColor: theme.primary,
      bgColor: Colors.white,
      shape: dto.shape,
      size: dto.size,
      prefix: dto.prefix,
      suffix: dto.suffix,
      disabled: dto.disabled,
      loading: dto.loading,
      border: true,
      borderColor: theme.primary,
      onPress: dto.onPress,
    );
  }

  factory AppButton.ghost({
    required AppButtonDto dto,
    required BuildContext context,
  }) {
    final theme = Theme.of(context).colorScheme;

    return AppButton(
      width: dto.width,
      text: dto.text,
      textColor: theme.primary,
      bgColor: Colors.transparent,
      shape: dto.shape,
      size: dto.size,
      prefix: dto.prefix,
      suffix: dto.suffix,
      disabled: dto.disabled,
      loading: dto.loading,
      border: true,
      borderColor: theme.primary,
      onPress: dto.onPress,
    );
  }
}

class AppButtonDto {
  AppButtonDto({
    required this.width,
    required this.text,
    this.shape = ButtonShape.semiRounded,
    this.size = ButtonSize.small,
    this.prefix,
    this.suffix,
    this.disabled = false,
    this.loading = false,
    this.onPress,
  });

  final double width;
  final String text;
  final ButtonShape shape;
  final ButtonSize size;
  final IconData? prefix;
  final IconData? suffix;
  final bool disabled;
  final bool loading;
  final dynamic Function()? onPress;
}
