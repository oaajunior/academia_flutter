import 'package:flutter/material.dart';

import '../home/home_page.dart';
import 'widgets/product_item_shop_widget.dart';
import '../../page/shop/widgets/stepper_shop_widget.dart';
import '../../page/shop/widgets/appbar_shop_widget.dart';

import '../../page/shop/widgets/payment_button_shop_widget.dart';

class ShopPage extends StatelessWidget {
  static const routeName = '/select_product';
  final fornecedor;
  ShopPage(this.fornecedor);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBarShopWidget(),
      body: SingleChildScrollView(
        child: Container(
          height: (1.0).sizeHeightScreen(),
          child: Column(
            children: [
              StepperShopWidget(),
              ProductItemShopWidget(fornecedor),
              PaymentButtonShopWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
