import 'package:flutter/material.dart';

const double kToolbarHeight = 56.0;

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  final String? title;
  final String? fontFamily;
  final AppBar? appBar;
  final bool? centerTitle;

  /// default to false
  final List<Widget>? widgets;
  final PreferredSizeWidget? bottom;

  /// you can add more fields that meet your needs

  const BaseAppBar(
      {Key? key,
      this.bottom,
      this.title,
      this.appBar,
      this.widgets,
      this.centerTitle = false,
      this.fontFamily = 'Komika',
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      title: Text(
        title ?? "",
        style: TextStyle(fontFamily: fontFamily),
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0.0));
}
