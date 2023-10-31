import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';

class AccountWidget extends StatelessWidget {
  final AppIcon appIcon;
  final BigText bigText;
  const AccountWidget({super.key, required this.appIcon, required this.bigText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: Dimension.width20,
        top: Dimension.width10,
        bottom: Dimension.width10
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 1,offset: const Offset(0, 2),color: Colors.grey.withOpacity(0.2))
        ],
      ),
      child: Row(
        children: [
          appIcon,
          SizedBox(width: Dimension.width20,),
          bigText,
        ],
      ),
    );
  }
}
