import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/pages/auth/sign_up_page.dart';
import 'package:food_delivery/routes/app_routes.dart';
import 'package:food_delivery/utils/custom_loader.dart';
import 'package:get/get.dart';

import '../../data/controller/auth_controller.dart';
import '../../utils/colors.dart';
import '../../utils/dimension.dart';
import '../../utils/show_custom_snackbar.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/big_text.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passController = TextEditingController();
    void login(AuthController authController) {
      // final authController = Get.find<AuthController>();

      String email = emailController.text.trim();

      String password = passController.text.trim();

       if (email.isEmpty) {
        showCustomSnackBar('Email cannot be empty', title: 'Email');
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar('Email should be valid', title: 'Email');
      } else if (password.isEmpty) {
        showCustomSnackBar('Password cannot be empty ', title: 'Password');
      } else if (password.length < 6) {
        showCustomSnackBar('Password should be minimum 6 character ',
            title: 'Password');
      }  else {
        showCustomSnackBar('All sent well', title: 'Perfect');

        authController.login(email, password).then((status) {
          if (status.isSuccess) {
            Get.toNamed(AppRoutes.getCart());
          } else {
            log(status.message);
          }
        });
      }
    }
    return Scaffold(
      body: GetBuilder<AuthController>(builder: (authController){
        return !authController.isLoading ? SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: Dimension.deviceHeight * 0.05,
              ),
              SizedBox(
                height: Dimension.deviceHeight * 0.25,
                child: const Center(
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('assets/image/logo part 1.png'),
                  ),
                ),
              ),
              SizedBox(
                height: Dimension.height20,
              ),
              Container(
                margin: EdgeInsets.only(left: Dimension.width20),
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: 'Hello',
                      textSize: Dimension.font20 * 3,
                      color: AppColors.mainBlackColor,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Sign into your account',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: Dimension.font20,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: Dimension.height20,
              ),
              AppTextField(
                  editingController: emailController,
                  hintText: 'email',
                  icon: Icons.email_outlined),
              SizedBox(
                height: Dimension.height20,
              ),
              AppTextField(
                editingController: passController,
                hintText: 'password',
                icon: Icons.password_outlined,isObscured: true,),
              SizedBox(
                height: Dimension.height20,
              ),
              GestureDetector(
                onTap:()=> login(authController),
                child: Container(
                  width: Dimension.deviceWidth / 2,
                  height: Dimension.deviceHeight / 13,
                  decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(Dimension.radius30)),
                  child: Center(
                    child: BigText(
                      text: 'Sign In',
                      textSize: Dimension.font20 + 10,
                      color: Colors.white,
                    ),
                  ),
                ),

              ),
              SizedBox(
                height: Dimension.height10,
              ),
              RichText(
                text: TextSpan(
                    text: 'Do not have an account? ',
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: Dimension.font20,
                    ),
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.to(() => const SignUpPage(),transition: Transition.fade),
                        text: 'Create',
                        style: TextStyle(
                          color: AppColors.mainBlackColor,
                          fontSize: Dimension.font20,
                        ),
                      )
                    ]),
              ),
            ],
          ),
        ) : const Center(child: CustomLoader(),);
      }),
    );
  }
}
