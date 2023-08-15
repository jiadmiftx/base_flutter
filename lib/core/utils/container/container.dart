import 'package:flutter/material.dart';

class LeftAlignedColumn extends StatelessWidget {
  final List<Widget> children;

  const LeftAlignedColumn({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(context) => Column(
        children: children,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
      );
}

class CenterAlignedColumn extends StatelessWidget {
  final List<Widget> children;

  const CenterAlignedColumn({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(context) => Column(
        children: children,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
      );
}

class RightAlignedColumn extends StatelessWidget {
  final List<Widget> children;

  const RightAlignedColumn({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(context) => Column(
        children: children,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
      );
}

class LeftAlignedRow extends StatelessWidget {
  final List<Widget> children;

  const LeftAlignedRow({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(context) => Row(
        children: children,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
      );
}

class RightAlignedRow extends StatelessWidget {
  final List<Widget> children;

  const RightAlignedRow({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(context) => Row(
        children: children,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
      );
}

class CenterAlignedRow extends StatelessWidget {
  final CrossAxisAlignment crossAxisAlignment;

  final List<Widget> children;

  const CenterAlignedRow({
    Key? key,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(context) => Row(
        children: children,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
      );
}

class SideToSideRow extends StatelessWidget {
  final CrossAxisAlignment crossAxisAlignment;

  final Widget left;

  final Widget right;

  const SideToSideRow({
    Key? key,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    required this.left,
    required this.right,
  }) : super(key: key);

  @override
  Widget build(context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          left,
          right,
        ],
        crossAxisAlignment: crossAxisAlignment,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      );
}

extension PaddedWidget on Widget {
  Widget topPadded4([final value = const EdgeInsets.only(top: 4)]) => Padding(
        child: this,
        padding: value,
      );
  Widget topPadded12([final value = const EdgeInsets.only(top: 12)]) => Padding(
        child: this,
        padding: value,
      );

  Widget topPadded16([final value = const EdgeInsets.only(top: 16)]) => Padding(
        child: this,
        padding: value,
      );

  Widget topPadded20([final value = const EdgeInsets.only(top: 20)]) => Padding(
        child: this,
        padding: value,
      );

  Widget topPadded30([final value = const EdgeInsets.only(top: 30)]) => Padding(
        child: this,
        padding: value,
      );

  Widget bottomPadded24([final value = const EdgeInsets.only(bottom: 24)]) =>
      Padding(
        child: this,
        padding: value,
      );

  Widget bottomPadded20([final value = const EdgeInsets.only(bottom: 20)]) =>
      Padding(
        child: this,
        padding: value,
      );

  Widget bottomPadded16([final value = const EdgeInsets.only(bottom: 16)]) =>
      Padding(
        child: this,
        padding: value,
      );

  Widget bottomPadded12([final value = const EdgeInsets.only(bottom: 12)]) =>
      Padding(
        child: this,
        padding: value,
      );

  Widget bottomPadded8([final value = const EdgeInsets.only(bottom: 8)]) =>
      Padding(
        child: this,
        padding: value,
      );

  Widget bottomPadded4([final value = const EdgeInsets.only(bottom: 4)]) =>
      Padding(
        child: this,
        padding: value,
      );

  Widget bottomPadded6([final value = const EdgeInsets.only(bottom: 6)]) =>
      Padding(
        child: this,
        padding: value,
      );

  Widget bottomPadded2([final value = const EdgeInsets.only(bottom: 2)]) =>
      Padding(
        child: this,
        padding: value,
      );

  Widget padded16([final value = const EdgeInsets.all(16)]) => Padding(
        child: this,
        padding: value,
      );

  Widget verticalpadded16(
          [final value = const EdgeInsets.symmetric(vertical: 16)]) =>
      Padding(
        child: this,
        padding: value,
      );

  Widget horizontalpadded16(
          [final value = const EdgeInsets.symmetric(horizontal: 16)]) =>
      Padding(
        child: this,
        padding: value,
      );

  Widget withoutTopPadded16(
          [final value = const EdgeInsets.only(
            bottom: 16,
            left: 16,
            right: 16,
          )]) =>
      Padding(
        child: this,
        padding: value,
      );

  Widget padded8([final value = const EdgeInsets.all(8)]) => Padding(
        child: this,
        padding: value,
      );

  Widget leftPadded16([final value = const EdgeInsets.only(left: 16)]) =>
      Padding(
        child: this,
        padding: value,
      );

  Widget leftPadded14([final value = const EdgeInsets.only(left: 14)]) =>
      Padding(
        child: this,
        padding: value,
      );

  Widget leftPadded8([final value = const EdgeInsets.only(left: 8)]) => Padding(
        child: this,
        padding: value,
      );

  Widget leftPadded4([final value = const EdgeInsets.only(left: 4)]) => Padding(
        child: this,
        padding: value,
      );

  Widget rightPadded14([final value = const EdgeInsets.only(right: 14)]) =>
      Padding(
        child: this,
        padding: value,
      );

  Widget rightPadded12([final value = const EdgeInsets.only(right: 12)]) =>
      Padding(
        child: this,
        padding: value,
      );

  Widget rightPadded16([final value = const EdgeInsets.only(right: 16)]) =>
      Padding(
        child: this,
        padding: value,
      );

  Widget rightPadded10([final value = const EdgeInsets.only(right: 10)]) =>
      Padding(
        child: this,
        padding: value,
      );

  Widget rightPadded8([final value = const EdgeInsets.only(right: 8)]) =>
      Padding(
        child: this,
        padding: value,
      );
  Widget rightPadded4([final value = const EdgeInsets.only(right: 4)]) =>
      Padding(
        child: this,
        padding: value,
      );

  Widget rightPadded6([final value = const EdgeInsets.only(right: 6)]) =>
      Padding(
        child: this,
        padding: value,
      );

  Widget sliderPadded20(
          [final value = const EdgeInsets.only(right: 20, left: 20)]) =>
      Padding(
        child: this,
        padding: value,
      );

  Widget padded([final value = 16]) => Padding(
        child: this,
        padding: EdgeInsets.all(value.toDouble()),
      );

  Widget paddedWithoutBottom([final value = 16]) => Padding(
        child: this,
        padding: EdgeInsets.only(
            left: value.toDouble(),
            right: value.toDouble(),
            top: value.toDouble()),
      );

  Widget paddedLTRB(
          {double left = 16,
          double top = 16,
          double right = 16,
          double bottom = 16}) =>
      Padding(
        child: this,
        padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      );

  Widget topPadded([final value = 16]) => Padding(
        child: this,
        padding: EdgeInsets.only(top: value.toDouble()),
      );

  Widget bottomPadded([final value = 16]) => Padding(
        child: this,
        padding: EdgeInsets.only(bottom: value.toDouble()),
      );

  Widget leftPadded([final value = 16]) => Padding(
        child: this,
        padding: EdgeInsets.only(left: value.toDouble()),
      );

  Widget horizontalPadded([final value = 16]) => Padding(
        child: this,
        padding: EdgeInsets.symmetric(horizontal: value.toDouble()),
      );

  Widget verticalPadded([final value = 16]) => Padding(
        child: this,
        padding: EdgeInsets.symmetric(vertical: value.toDouble()),
      );
}
