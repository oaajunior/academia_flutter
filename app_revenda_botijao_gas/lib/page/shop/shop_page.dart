import 'package:flutter/material.dart';

import '../home/home_page.dart';
import '../../page/shop/widgets/product_quantity_shop_widget.dart';
import '../../page/shop/widgets/stepper_shop_widget.dart';
import '../../page/shop/widgets/appbar_shop_widget.dart';
import './widgets/product_description_shop_widget.dart';
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
              ProductDescriptionShopWidget(fornecedor),
              ProductQuantityShopWidget(fornecedor),
              PaymentButtonShopWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
