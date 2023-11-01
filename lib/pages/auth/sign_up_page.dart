import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimension.dart';
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
    return Scaffold(
      body: SingleChildScrollView(
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
                icon: Icons.password_outlined),
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
            Container(
              width: Dimension.deviceWidth / 2,
              height: Dimension.deviceHeight / 13,
              decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(Dimension.radius30)),
              child: Center(
                child: BigText(
                  text: 'Sign Up',
                  textSize: Dimension.font20 + 10,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: Dimension.height10,
            ),
            RichText(
              text: TextSpan(
                recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
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
                    backgroundImage:
                        AssetImage('assets/image/' + signUpImages[index]),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
