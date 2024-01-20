import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimension.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController editingController;
  final String hintText;
  final IconData icon;
  bool isObscured;
  bool isMaxLine;
  AppTextField({super.key, required this.editingController, required this.hintText, required this.icon,this.isObscured = false,this.isMaxLine = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: Dimension.height20,right: Dimension.radius20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimension.radius30),
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                spreadRadius: 7,
                offset: Offset(1,10),
                color: Colors.grey.withOpacity(0.2)
            )
          ]
      ),
      child: TextField(
        maxLines: isMaxLine?3:1,
        obscureText: isObscured ? true : false,
        controller: editingController,
        onChanged: (val){
          print(val);
        },
        decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(icon,color: AppColors.yellowColor,),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimension.radius30),
                borderSide: const BorderSide(
                  color: Colors.white,width: 1,
                )
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimension.radius30),
                borderSide: const BorderSide(
                  color: Colors.white,width: 1,
                )
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimension.radius30),
            )
        ),
      ),
    );
  }
}
