import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/data/controller/auth_controller.dart';
import 'package:food_delivery/models/sign_up_body.dart';
import 'package:food_delivery/pages/auth/sign_in_page.dart';
import 'package:food_delivery/routes/app_routes.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/custom_loader.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:food_delivery/utils/show_custom_snackbar.dart';
import 'package:food_delivery/widgets/app_text_field.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passController = TextEditingController();
    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    var signUpImages = ['t.png', 'f.png', 'g.png'];

    void registration(AuthController authController) {
      // final authController = Get.find<AuthController>();
      String name = nameController.text.trim();
      String email = emailController.text.trim();
      String phone = phoneController.text.trim();
      String password = passController.text.trim();

      if (name.isEmpty) {
        showCustomSnackBar('Type in your name', title: 'Name');
      } else if (email.isEmpty) {
        showCustomSnackBar('Email cannot be empty', title: 'Email');
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar('Email should be valid', title: 'Email');
      } else if (password.isEmpty) {
        showCustomSnackBar('Password cannot be empty ', title: 'Password');
      } else if (password.length < 6) {
        showCustomSnackBar('Password should be minimum 6 character ',
            title: 'Password');
      } else if (phone.isEmpty) {
        showCustomSnackBar('Phone cannot be empty', title: 'Phone');
      } else {
        SignUpBody signUpBody = SignUpBody(
            name: name, email: email, phone: phone, password: password);
        authController.registration(signUpBody).then((status) {
          if (status.isSuccess) {
            Get.offNamed(AppRoutes.getInitial());
          } else {
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
      body: GetBuilder<AuthController>(builder: (authController) {
        return !authController.isLoading
            ? SingleChildScrollView(
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
                          backgroundImage:
                              AssetImage('assets/image/logo part 1.png'),
                        ),
                      ),
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
                    AppTextField(
                        editingController: nameController,
                        hintText: 'name',
                        icon: Icons.person),
                    SizedBox(
                      height: Dimension.height20,
                    ),
                    AppTextField(
                        editingController: phoneController,
                        hintText: 'phone',
                        icon: Icons.phone),
                    SizedBox(
                      height: Dimension.height20,
                    ),
                    InkWell(
                      onTap: () => registration(authController),
                      child: Container(
                        width: Dimension.deviceWidth / 2,
                        height: Dimension.deviceHeight / 13,
                        decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            borderRadius:
                                BorderRadius.circular(Dimension.radius30)),
                        child: Center(
                          child: BigText(
                            text: 'Sign Up',
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
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.back(),
                        text: 'Have an account already?',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: Dimension.font20,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimension.height10 * 3,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Sign upp using one of the following methods',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: Dimension.font20 - 4,
                        ),
                      ),
                    ),
                    Wrap(
                      children: List.generate(
                        3,
                        (index) => Padding(
                          padding: const EdgeInsets.all(8),
                          child: CircleAvatar(
                            radius: Dimension.radius20,
                            backgroundImage: AssetImage(
                                'assets/image/' + signUpImages[index]),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            : const Center(
                child: CustomLoader(),
              );
      }),
    );
  }
}
