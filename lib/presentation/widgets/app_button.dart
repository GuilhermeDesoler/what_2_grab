import 'package:flutter/material.dart';
import 'package:what_2_grab/presentation/widgets/main.dart';

class AppButton extends CustomButton {
  const AppButton({
    required super.text,
    required super.textColor,
    required super.bgColor,
    super.shape,
    super.size,
    super.disabled,
    super.border,
    super.borderColor,
    super.onPress,
    super.key,
  });

  factory AppButton.primary({
    required String text,
    ButtonSize size = ButtonSize.meddium,
    bool disabled = false,
    Future<void> Function()? onPress,
  }) {
    return AppButton(
      text: text,
      textColor: Colors.white,
      bgColor: Colors.blue,
      size: size,
      disabled: disabled,
      onPress: onPress,
    );
  }

  factory AppButton.secondary({
    required String text,
    ButtonSize size = ButtonSize.meddium,
    bool disabled = false,
    Future<void> Function()? onPress,
  }) {
    return AppButton(
      text: text,
      textColor: Colors.blue,
      bgColor: Colors.white,
      size: size,
      disabled: disabled,
      border: true,
      borderColor: Colors.blue,
      onPress: onPress,
    );
  }
}
