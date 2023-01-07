import 'package:asc_portfolio/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constant/assets.dart';

class BaseScaffold extends StatelessWidget {
  final Widget body;
  final Widget? appBarLeadingWidget;
  final Widget? appBarTitle;
  final bool appBarCenterTitle;
  final double? appBarElevation;
  final List<Widget>? appBarActions;
  final Widget? drawer, floatingActionButton, bottomNavigationBar;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Color? backgroundColor;
  final bool? resizeToAvoidBottomInset;
  const BaseScaffold({
    super.key,
    required this.body,
    this.appBarLeadingWidget,
    this.appBarTitle,
    this.appBarCenterTitle = true,
    this.appBarElevation,
    this.appBarActions,
    this.drawer,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.bottomNavigationBar,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: AppBar(
        backgroundColor: AppColor.appPurple,
        leading: appBarLeadingWidget ?? (context.canPop() ? const BackButton() : null),
        title: appBarTitle ??
            Image.asset(
              AppAssets.logo,
              fit: BoxFit.cover,
              width: 150,
              height: 150,
            ),
        centerTitle: appBarCenterTitle,
        elevation: appBarElevation ?? 0,
        actions: appBarActions,
      ),
      drawer: drawer,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      body: SafeArea(child: body),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
