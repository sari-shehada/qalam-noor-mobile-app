import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    this.appBar,
    this.body,
    this.bodyPadding = EdgeInsets.zero,
    this.floatingActionButton,
    this.bottomSection,
    this.backgroundColor,
    this.extendBody = false,
  });

  final PreferredSizeWidget? appBar;
  final Widget? body;
  final EdgeInsetsGeometry bodyPadding;
  final Widget? floatingActionButton;
  final Widget? bottomSection;
  final Color? backgroundColor;
  final bool extendBody;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: extendBody,
      backgroundColor: backgroundColor,
      floatingActionButton: floatingActionButton,
      appBar: appBar,
      body: SizedBox.expand(
        child: Padding(
          padding: bodyPadding,
          child: body,
        ),
      ),
      bottomNavigationBar: bottomSection,
    );
  }
}
