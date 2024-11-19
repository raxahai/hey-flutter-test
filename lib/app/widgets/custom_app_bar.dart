import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.leading,
    this.leadingColor,
    this.centerTitle,
    this.elevation,
    this.backgroundColor,
    this.leadingOnTap,
  });

  final Widget? leading;
  final Color? leadingColor;
  final void Function()? leadingOnTap;
  final Widget? title;
  final bool? centerTitle;
  final double? elevation;
  final Color? backgroundColor;

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      title: title,
      leading: leading ??
          GestureDetector(
            onTap: leadingOnTap ?? Get.back,
            child: Icon(
              Icons.west,
              color: leadingColor ?? Colors.black,
              size: 24.75,
            ),
          ),
      centerTitle: centerTitle,
      elevation: elevation ?? 0,
    );
  }
}
