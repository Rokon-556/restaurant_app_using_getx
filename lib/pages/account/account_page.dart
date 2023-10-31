import 'package:flutter/material.dart';
import 'package:food_delivery/pages/account/account_widget.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: BigText(
          text: 'Profile',
          textSize: 24,
          color: Colors.white,
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: Dimension.height20),
        width: double.maxFinite,
        child: Column(
          children: [
            AppIcon(
              icon: Icons.person,
              iconSize: Dimension.height15 * 5,
              size: Dimension.height15 * 10,
              bgColor: AppColors.mainColor,
              iconColor: Colors.white,
            ),
            SizedBox(
              height: Dimension.height30,
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  AccountWidget(
                    appIcon: AppIcon(
                      icon: Icons.person,
                      iconSize: Dimension.height20,
                      size: Dimension.height40,
                      bgColor: AppColors.mainColor,
                      iconColor: Colors.white,
                    ),
                    bigText: BigText(text: 'Rokon'),
                  ),
                  SizedBox(
                    height: Dimension.height20,
                  ),
                  AccountWidget(
                    appIcon: AppIcon(
                      icon: Icons.phone,
                      iconSize: Dimension.height20,
                      size: Dimension.height40,
                      bgColor: AppColors.yellowColor,
                      iconColor: Colors.white,
                    ),
                    bigText: BigText(text: '015------------'),
                  ),
                  SizedBox(
                    height: Dimension.height20,
                  ),
                  AccountWidget(
                    appIcon: AppIcon(
                      icon: Icons.email_outlined,
                      iconSize: Dimension.height20,
                      size: Dimension.height40,
                      bgColor: AppColors.yellowColor,
                      iconColor: Colors.white,
                    ),
                    bigText: BigText(text: 'rokon@gmmail.com'),
                  ),
                  SizedBox(
                    height: Dimension.height20,
                  ),
                  AccountWidget(
                    appIcon: AppIcon(
                      icon: Icons.message_outlined,
                      iconSize: Dimension.height20,
                      size: Dimension.height40,
                      bgColor: Colors.redAccent,
                      iconColor: Colors.white,
                    ),
                    bigText: BigText(text: 'Message'),
                  ),
                  SizedBox(
                    height: Dimension.height20,
                  ),
                  AccountWidget(
                    appIcon: AppIcon(
                      icon: Icons.location_on_outlined,
                      iconSize: Dimension.height20,
                      size: Dimension.height40,
                      bgColor: AppColors.yellowColor,
                      iconColor: Colors.white,
                    ),
                    bigText: BigText(text: 'Address'),
                  ),
                  SizedBox(
                    height: Dimension.height20,
                  ),

                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
