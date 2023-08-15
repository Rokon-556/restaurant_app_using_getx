import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimension.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/food_name_column.dart';
import 'package:food_delivery/widgets/icon_and_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.83);
  double _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = 220.0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: Dimension.pageView,
            child: PageView.builder(
                controller: pageController,
                itemCount: 5,
                itemBuilder: (context, position) => _buildPageItem(position)),
          ),
          DotsIndicator(
            dotsCount: 5,
            position: _currentPageValue.toInt(),
            decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeColor: AppColors.mainColor,
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          ),
          SizedBox(
            height: Dimension.height30,
          ),
          Container(
            margin: EdgeInsets.only(left: Dimension.width30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                BigText(text: 'Popular'),
                SizedBox(
                  width: Dimension.width10,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 3),
                  child: BigText(
                    text: '.',
                    color: Colors.black26,
                  ),
                ),
                SizedBox(
                  width: Dimension.width10,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 2),
                  child: SmallText(
                    text: 'Food pairing',
                  ),
                )
              ],
            ),
          ),
          SizedBox(height:Dimension.height20),
          popularFoodList()
        ],
      ),
    );
  }

  ListView popularFoodList() {
    return ListView.builder(
      padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(
                bottom: Dimension.height10,
                left: Dimension.width20,
                right: Dimension.width20),
            child: Row(
              children: [
                Container(
                  height: Dimension.imageHeight,
                  width: Dimension.imageHeight,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimension.radius20),
                      image: DecorationImage(
                          image: AssetImage('assets/image/food0.png'),
                          fit: BoxFit.cover)),
                ),
                Expanded(
                  child: Container(
                    height: Dimension.listViewTextHeight,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(Dimension.radius20),
                            bottomRight: Radius.circular(Dimension.radius20))),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: Dimension.width10,vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BigText(text: 'Nutritious Food Meal in China'),
                          SizedBox(
                            height: Dimension.height10,
                          ),
                          SmallText(text: 'Chinese Recipe'),
                          SizedBox(
                            height: Dimension.height10,
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
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  Widget _buildPageItem(int index) {
    print('Height' + MediaQuery.of(context).size.height.toString());
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTransform = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTransform, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currentScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currentTransform = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTransform, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTransform = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTransform, 0);
    } else {
      var currentScale = _scaleFactor;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimension.pageContainerView,
            margin: const EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(
              color: index.isEven ? Colors.redAccent : Colors.amberAccent,
              borderRadius: BorderRadius.circular(Dimension.radius30),
              image: const DecorationImage(
                  image: AssetImage('assets/image/food0.png'),
                  fit: BoxFit.cover),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimension.pageTextView,
              margin: EdgeInsets.only(
                  left: Dimension.width30,
                  right: Dimension.width30,
                  bottom: Dimension.width15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0xffe8e8e8),
                        blurRadius: 5.0,
                        offset: Offset(0, 5)),
                    BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                    BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                  ]),
              child: Container(
                padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
                child: const FoodNameColumn(text: 'Bitter Orange Marinade',),
              ),
            ),
          )
        ],
      ),
    );
  }
}
