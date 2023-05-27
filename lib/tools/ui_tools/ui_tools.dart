import 'package:flutter/material.dart';

class AddVerticalSpacing extends StatelessWidget {
  const AddVerticalSpacing({required this.value, super.key});

  final double value;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: value,
    );
  }
}

class AddHorizontalSpacing extends StatelessWidget {
  const AddHorizontalSpacing({required this.value, super.key});

  final double value;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: value,
    );
  }
}
