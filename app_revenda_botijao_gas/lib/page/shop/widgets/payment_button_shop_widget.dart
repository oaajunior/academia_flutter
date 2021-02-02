import 'dart:ui';

import 'package:flutter/material.dart';

import '../../home/home_page.dart';

class PaymentButtonShopWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: const EdgeInsets.only(bottom: 8.0),
            height: (0.1).sizeHeightScreen(),
            width: (0.55).sizeWidthScreen(),
            child: Center(
              child: Text('IR PARA O PAGAMENTO').customText(
                fontSize: 36,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(100.0),
              ),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.lightBlue[400],
                  Colors.blue[800],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
