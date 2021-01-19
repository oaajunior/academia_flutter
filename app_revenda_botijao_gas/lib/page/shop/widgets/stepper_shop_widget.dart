import 'package:flutter/material.dart';
import '../../home/home_page.dart';

class StepperShopWidget extends StatelessWidget {
  Widget _buildCircle(
      {Color colorCircle,
      Color colorFilledCircle,
      bool showBoxShadow = false}) {
    return Container(
      width: (0.04).sizeWidthScreen(),
      height: (0.04).sizeHeightScreen(),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: colorFilledCircle,
        border: Border.all(
          color: colorCircle,
          width: 1,
        ),
        boxShadow: [
          showBoxShadow
              ? BoxShadow(
                  color: Colors.grey[300],
                  offset: Offset(0, 0),
                  spreadRadius: 10.0)
              : BoxShadow(),
        ],
      ),
    );
  }

  Widget _buildLine() {
    return Container(
      height: (0.002).sizeHeightScreen(),
      width: (0.14).sizeWidthScreen(),
      color: Colors.grey[300],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: (0.16).sizeHeightScreen(),
      width: (1.0).sizeWidthScreen(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 16.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                _buildCircle(
                  colorFilledCircle: Colors.blue,
                  colorCircle: Colors.blue,
                  showBoxShadow: true,
                ),
                _buildLine(),
                _buildCircle(
                  colorFilledCircle: Colors.white,
                  colorCircle: Colors.grey[400],
                ),
                _buildLine(),
                _buildCircle(
                  colorFilledCircle: Colors.white,
                  colorCircle: Colors.grey[400],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              right: 24.0,
              top: 8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Comprar').customText(
                  fontSize: 42,
                  fontWeight: FontWeight.w300,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text('Pagamento').customText(
                    fontSize: 42,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text('Confirmação').customText(
                  fontSize: 42,
                  fontWeight: FontWeight.w300,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
