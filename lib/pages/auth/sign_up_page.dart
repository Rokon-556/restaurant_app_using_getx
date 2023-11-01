import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:food_delivery/widgets/app_text_field.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passController = TextEditingController();
    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: Dimension.deviceHeight * 0.05,
          ),
          Container(
            height: Dimension.deviceHeight * 0.25,
            child: Center(
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
          SizedBox(height: Dimension.height20,),
          AppTextField(
              editingController: passController,
              hintText: 'password',
              icon: Icons.password_outlined),
          SizedBox(height: Dimension.height20,),
          AppTextField(
              editingController: nameController,
              hintText: 'name',
              icon: Icons.person),
          SizedBox(height: Dimension.height20,),
          AppTextField(
              editingController: phoneController,
              hintText: 'phone',
              icon: Icons.phone),
          SizedBox(height: Dimension.height20,),
        ],
      ),
    );
  }
}
