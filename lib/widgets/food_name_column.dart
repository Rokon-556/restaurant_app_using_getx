import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

import '../utils/dimension.dart';

class FoodNameColumn extends StatelessWidget {
  final String text;
  const FoodNameColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text),
        SizedBox(
          height: Dimension.height15,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                5,
                    (index) => Icon(
                  Icons.star,
                  color: AppColors.mainColor,
                  size: 15,
                ),
              ),
            ),
            SizedBox(
              width: Dimension.width10,
            ),
            SmallText(text: '4.5'),
            SizedBox(
              width: Dimension.width10,
            ),
            SmallText(text: '1214 Comments'),
          ],
        ),
        SizedBox(
          height: Dimension.height20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndText(
                text: 'Normal',
                icon: Icons.circle_sharp,
                iconColor: AppColors.iconColor1),
            IconAndText(
                text: '1.7 km',
                icon: Icons.location_on,
                iconColor: AppColors.mainColor),
            IconAndText(
                text: '32 min',
                icon: Icons.access_time,
                iconColor: AppColors.iconColor2),
          ],
        )
      ],
    );
  }
}
