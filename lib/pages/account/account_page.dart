import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_delivery/data/controller/auth_controller.dart';
import 'package:food_delivery/data/controller/cart_controller.dart';
import 'package:food_delivery/data/controller/location_controller.dart';
import 'package:food_delivery/data/controller/user_controller.dart';
import 'package:food_delivery/pages/account/account_widget.dart';
import 'package:food_delivery/routes/app_routes.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/custom_loader.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool _isLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (_isLoggedIn) {
      Get.find<UserController>().getUserData();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: BigText(
          text: 'Profile',
          textSize: 24,
          color: Colors.white,
        ),
      ),
      body: GetBuilder<UserController>(builder: (userController) {
        return _isLoggedIn
            ? (userController.isLoading
                ? Container(
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
                                bigText: BigText(
                                    text: userController.userModel?.name??''),
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
                                bigText: BigText(
                                    text: userController.userModel?.phone??''),
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
                                bigText: BigText(
                                    text: userController.userModel?.email??''),
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
                            GetBuilder<LocationController>(builder: (locController){
                              if(_isLoggedIn && locController.addressList.isEmpty){
                                return InkWell(
                                  onTap: (){
                                    Get.offNamed(AppRoutes.getAddressPage());
                                  },
                                  child: AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.location_on_outlined,
                                      iconSize: Dimension.height20,
                                      size: Dimension.height40,
                                      bgColor: AppColors.yellowColor,
                                      iconColor: Colors.white,
                                    ),
                                    bigText: BigText(text: 'Fill Your Address'),
                                  ),
                                );
                              }else{
                                return InkWell(
                                  onTap: (){
                                    Get.offNamed(AppRoutes.getAddressPage());
                                  },
                                  child: AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.location_on_outlined,
                                      iconSize: Dimension.height20,
                                      size: Dimension.height40,
                                      bgColor: AppColors.yellowColor,
                                      iconColor: Colors.white,
                                    ),
                                    bigText: BigText(text: 'Your Address'),
                                  ),
                                );
                              }
                            }),
                              SizedBox(
                                height: Dimension.height20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  log('log out happens');
                                  if (Get.find<AuthController>()
                                      .userLoggedIn()) {
                                    Get.find<AuthController>()
                                        .clearSharedData();
                                    Get.find<CartController>().clearCart();
                                    Get.find<CartController>()
                                        .clearCartHistory();
                                    Get.offNamed(AppRoutes.getSignIn());
                                    log('log out ends');
                                  }
                                },
                                child: AccountWidget(
                                  appIcon: AppIcon(
                                    icon: Icons.logout,
                                    iconSize: Dimension.height20,
                                    size: Dimension.height40,
                                    bgColor: Colors.redAccent,
                                    iconColor: Colors.white,
                                  ),
                                  bigText: BigText(text: 'Logout'),
                                ),
                              ),
                            ],
                          ),
                        ))
                      ],
                    ),
                  )
                :  SizedBox(height: Get.height,child: const Center(child: CustomLoader(),),))
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: Dimension.height60 * 3,
              width: double.maxFinite,
              margin: EdgeInsets.only(
                  left: Dimension.width20, right: Dimension.width20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimension.radius20),
                  image: const DecorationImage(
                      image: AssetImage(
                        'assets/image/signintocontinue.png',
                      ),
                      fit: BoxFit.cover)),
            ),
            GestureDetector(
              onTap: (){
                Get.toNamed(AppRoutes.getSignIn());
              },
              child: Container(
                height: Dimension.height60 * 1.5,
                width: double.maxFinite,
                margin: EdgeInsets.only(
                    left: Dimension.width20, right: Dimension.width20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimension.radius20),
                  color: AppColors.mainColor
                    ),
                child: Center(child: BigText(text: 'Sign In',color: Colors.white,textSize: Dimension.font20+6,),),
              ),
            )
          ],
        );
      }),
    );
  }
}
