import 'package:flutter/material.dart';
import 'package:food_delivery/base/custom_app_bar.dart';
import 'package:food_delivery/data/controller/auth_controller.dart';
import 'package:food_delivery/data/controller/order_controller.dart';
import 'package:food_delivery/pages/order/view_order_page.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:get/get.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with TickerProviderStateMixin {
  late TabController _tabController ;
  late bool _isLoggedIn;

  // void initializeTabController(){
  //   _isLoggedIn = Get.find<AuthController>().userLoggedIn();
  //   if (_isLoggedIn) {
  //     _tabController = TabController(length: 2, vsync: this);
  //     Get.find<OrderController>().getOrderList();
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // initializeTabController();
    _isLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (_isLoggedIn) {
      Get.find<OrderController>().getOrderList();
      _tabController = TabController(length: 2, vsync: this);
      Get.find<OrderController>().getOrderList();
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const CustomAppBar(title: 'My Orders'),
      // appBar: AppBar(
      //   backgroundColor: AppColors.mainColor,
      //   elevation: 1,
      //   title: Text('My Orders'),
      // ),
      body: Column(
        children: [
          Container(
            child: TabBar(
                controller: _tabController,
                indicatorColor: Theme.of(context).primaryColor,
                unselectedLabelColor: AppColors.yellowColor,
                indicatorWeight: 3,
                labelColor: Theme.of(context).primaryColor,
                tabs: const [Tab(text: 'current'), Tab(text: 'history')]),
          ),
          Expanded(
              child: TabBarView(
            controller: _tabController,
            children: const [
              ViewOrderPage(isCurrent: true),
              ViewOrderPage(isCurrent: false),
            ],
          ))
        ],
      ),
    );
  }
}
