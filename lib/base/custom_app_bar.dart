import 'package:flutter/material.dart';
import 'package:food_delivery/routes/app_routes.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/big_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool backButtonExist;
  final Function? onBackPressed;
  const CustomAppBar(
      {super.key,
      required this.title,
      this.backButtonExist = true,
      this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: BigText(
          text: title,
          color: Colors.white,

        ),
        backgroundColor: AppColors.mainColor,
        elevation: 0,
        leading: backButtonExist
            ? IconButton(
                onPressed: () =>
                    onBackPressed ??
                    Navigator.pushReplacementNamed(context, AppRoutes.getInitial()),
                icon: Icon(Icons.arrow_back_ios_new))
            : Container());
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(500, 50);
}
