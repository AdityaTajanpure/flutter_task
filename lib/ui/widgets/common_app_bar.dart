import 'package:flutter/material.dart';
import 'package:flutter_task/styles/colors.dart';
import 'package:flutter_task/utils/extensions.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.accentColor,
      leadingWidth: 120,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Image.asset(
          'assets/images/logo.gif',
        ),
      ),
      actions: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/promotion_icon.png',
              width: 6.w,
            ),
            const SizedBox(height: 2),
            const Text(
              'Promotion',
              style: TextStyle(
                color: AppColors.accentColor2,
              ),
            ),
          ],
        ),
        const SizedBox(width: 10),
        Container(
          width: 25.w,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.accentColor2,
                AppColors.accentColor3,
                AppColors.accentColor3,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          alignment: Alignment.center,
          child: const Text(
            'LOGIN',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
