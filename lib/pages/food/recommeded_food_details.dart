import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/bottom_section.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';

class RecommendedFoodDetails extends StatelessWidget {
  const RecommendedFoodDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            backgroundColor: AppColors.yellowColor,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart)
              ],
            ),
            expandedHeight: 300,
            pinned: true,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimension.radius20),
                      topRight: Radius.circular(Dimension.radius20),
                    )),
                child: Center(
                  child: BigText(
                    text: "Chinese Cuisine",
                    textSize: Dimension.font20 + 6,
                  ),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/image/food0.png',
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: Dimension.width20),
                  child: ExpandableTextWidget(
                    text:
                        'Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book hhf ejhsihdas idguiqweyqwude uidgqwu8dtqw9 uiwdgyuqwdgaswidb aqidgqwuiegqwu8 asdhyas ajsikdgqwuidg jskdgaikdhqwui iAKDHIKAQDGH JKWDHQWUIDYQW UIQWDHASIDHA AISDHAUOwdh hiaswduqwodb ajhdgqwyud  UIWDTQWUIE ASDIHASDK;DP WUIDYTQWUIEDTGQ UIDGQWUIDTQW8OEB ASDHASWoidagswdaqowduiqwodqbk sdjkdha ow;fj;weof lorjwerjipwe qefojhqweoip  efhiwe;p isdfow;pehoi;p oiwerfqweprh weoifdhqweoir oaedfjhpqweo0 ekwqhdqweiporu qweoirhqwerih weofhiwepr weoifphwepo woerhiqweprh oqwehipqw o qwdhoqwprih o qiqw[ qwodhqwdoih hqwrihqwed oq wehqhl;   qowhrq  oehpqwp q owdhepqwhc q  woic hhqwdhoi qdeb qiwehqweohq   ASKAs qoiwihdsqwe[h  o[ehdpqwehdg; efb q hqwhoipq  weophq  wphpqwhpqwebbqwdhqwphi  ophqwbqwoiphpqwo qweoiheopq  xhiqwehqwphb qwhiee  qb  qq  whoiqwephpqweowoerikhqweoipru kwieorhipweorq weoirfhweiroyhqw34 weiupgweryt4efbwef iqwefrweoirye iqwewoiergwie dawsidugqw8dt awdtqwu8idtqw aWSDUIGQW8DEO QWIDEGTQWDE DGQWUDETQWETQWD QWIDTQW8DTQWO8',
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: Dimension.width20 * 2.5,
              vertical: Dimension.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.remove,
                  bgColor: AppColors.mainColor,
                  iconSize: Dimension.icon24,
                  iconColor: Colors.white,
                ),
                BigText(text: '\$12.88 '+' X '+ ' 0 ',textSize: Dimension.font20+6,color: AppColors.mainBlackColor,),
                AppIcon(
                  icon: Icons.add,
                  bgColor: AppColors.mainColor,
                  iconSize: Dimension.icon24,
                  iconColor: Colors.white,
                )
              ],
            ),
          ),
          BottomSection(widget: Icon(Icons.favorite,color: AppColors.mainColor,),)
        ],
      ),
    );
  }
}
