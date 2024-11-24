import 'package:calculate_time_app/app_utils/basic_import.dart';
import 'package:flutter/material.dart';


class CommonAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppbar({super.key, this.actions, this.title, this.onTap, this.centerTitle, this.hideBack = false});

  final List<Widget>? actions;
  final Widget? title;
  final bool? centerTitle;
  final VoidCallback? onTap;
  final bool hideBack;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: centerTitle ?? true,
      titleSpacing: 0,
      leading: Visibility(
        visible: !hideBack,
        child: IconButton(
          onPressed: () {
            if (onTap != null) {
              onTap!();
            } else {
              Navigator.pop(context);
            }
          },
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
      ),
      actions: actions?.map((action) {
        return Padding(
          padding: EdgeInsets.only(right: Dimensions.commonPaddingForScreen),
          child: action,
        );
      }).toList(),
      title: title,
      elevation: 0,
      scrolledUnderElevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
