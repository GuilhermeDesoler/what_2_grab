import 'package:flutter/material.dart';
import 'package:what_2_grab/presentation/widgets/main.dart';

const width = 150.0;

function() => Future.delayed(Duration(seconds: 2));

final prefix = Icons.check;
final suffix = Icons.check_circle;

final appButtonsRoundedList = [
  AppButtonDto(
    width: width,
    text: 'Small',
    size: ButtonSize.small,
    shape: ButtonShape.rounded,
    prefix: prefix,
    suffix: suffix,
    onPress: function,
  ),
  AppButtonDto(
    width: width,
    text: 'Medium',
    size: ButtonSize.meddium,
    shape: ButtonShape.rounded,
    prefix: prefix,
    suffix: suffix,
    onPress: function,
  ),
  AppButtonDto(
    width: width,
    text: 'Big',
    size: ButtonSize.big,
    shape: ButtonShape.rounded,
    prefix: prefix,
    suffix: suffix,
    onPress: function,
  ),
];

final appButtonsSemiList = [
  AppButtonDto(
    width: width,
    text: 'Small',
    size: ButtonSize.small,
    shape: ButtonShape.semiRounded,
    prefix: prefix,
    suffix: suffix,
    onPress: function,
  ),
  AppButtonDto(
    width: width,
    text: 'Medium',
    size: ButtonSize.meddium,
    shape: ButtonShape.semiRounded,
    prefix: prefix,
    suffix: suffix,
    onPress: function,
  ),
  AppButtonDto(
    width: width,
    text: 'Big',
    size: ButtonSize.big,
    shape: ButtonShape.semiRounded,
    prefix: prefix,
    suffix: suffix,
    onPress: function,
  ),
];

final appButtonsSquareList = [
  AppButtonDto(
    width: width,
    text: 'Small',
    size: ButtonSize.small,
    shape: ButtonShape.squared,
    prefix: prefix,
    suffix: suffix,
    onPress: function,
  ),
  AppButtonDto(
    width: width,
    text: 'Medium',
    size: ButtonSize.meddium,
    shape: ButtonShape.squared,
    prefix: prefix,
    suffix: suffix,
    onPress: function,
  ),
  AppButtonDto(
    width: width,
    text: 'Big',
    size: ButtonSize.big,
    shape: ButtonShape.squared,
    prefix: prefix,
    suffix: suffix,
    onPress: function,
  ),
];
