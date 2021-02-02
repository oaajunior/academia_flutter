import 'package:flutter/material.dart';

import '../../home/home_page.dart';
import '../../../model/fornecedor_model.dart';

class ProductDescriptionShopWidget extends StatelessWidget {
  final Fornecedor fornecedor;
  ProductDescriptionShopWidget(this.fornecedor);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4.0),
      color: Colors.white,
      width: (1.0).sizeWidthScreen(),
      height: (0.1).sizeHeightScreen(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 8.0,
                ),
                child: Container(
                  alignment: Alignment.center,
                  child: Text('1').customText(
                    color: Colors.white,
                    align: TextAlign.center,
                    fontSize: 42,
                  ),
                  width: (0.08).sizeWidthScreen(),
                  height: (0.08).sizeHeightScreen(),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                width: (0.6).sizeWidthScreen(),
                child: Text('${fornecedor.nome} - Botijão de 13kg').customText(
                  fontSize: 40,
                ),
              )
            ],
          ),
          Row(
            textBaseline: TextBaseline.alphabetic,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('R\$').customText(
                fontSize: 36,
                align: TextAlign.end,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 4.0,
                  right: 16.0,
                ),
                child: Text(
                        '${fornecedor?.preco?.toStringAsFixed(2)?.replaceFirst('.', ',') ?? 0.0}')
                    .customText(
                  fontSize: 62,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
