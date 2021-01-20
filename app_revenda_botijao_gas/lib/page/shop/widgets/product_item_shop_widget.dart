import 'package:app_revenda_botijao_gas/model/fornecedor_model.dart';
import 'package:flutter/material.dart';

import '../../home/home_page.dart';

class ProductItemShopWidget extends StatefulWidget {
  final Fornecedor fornecedor;
  ProductItemShopWidget(this.fornecedor);

  @override
  _ProductItemShopWidgetState createState() => _ProductItemShopWidgetState();
}

class _ProductItemShopWidgetState extends State<ProductItemShopWidget> {
  int cylinderQuantity;
  double totalPrice;
  Fornecedor fornecedor;
  @override
  void initState() {
    cylinderQuantity = 1;
    totalPrice = widget.fornecedor.preco;
    fornecedor = widget.fornecedor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildDescription(),
        _buildItemQuantity(),
      ],
    );
  }

  Widget _buildDescription() {
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
                width: (0.5).sizeWidthScreen(),
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
                  right: 8.0,
                ),
                child: Text(
                        '${totalPrice.toStringAsFixed(2)?.replaceFirst('.', ',') ?? 0.0}')
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

  Widget _buildItemQuantity() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: (0.14).sizeHeightScreen(),
          width: (1.0).sizeWidthScreen(),
          margin: const EdgeInsets.only(
            top: 16.0,
            right: 16.0,
            left: 16.0,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 4.0),
                alignment: Alignment.centerLeft,
                width: (0.1).sizeWidthScreen(),
                height: (0.16).sizeHeightScreen(),
                child: Icon(
                  Icons.home,
                  color: Colors.grey,
                  size: (0.07).sizeHeightScreen(),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16.0,
                      left: 32.0,
                    ),
                    child: Text(fornecedor.nome).customText(
                      fontSize: 42,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      top: 16.0,
                      left: 32.0,
                    ),
                    width: (0.4).sizeWidthScreen(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('${fornecedor.nota}').customText(
                              fontSize: 42,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.orangeAccent,
                              size: (0.02).sizeHeightScreen(),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('${fornecedor.tempoMedio}').customText(
                              fontSize: 42,
                            ),
                            Text('min').customText(
                              fontSize: 42,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 32.0,
                        right: 8.0,
                      ),
                      color: Color(
                        int.parse('0xFF${fornecedor?.cor ?? 'FFFFFF'}'),
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${fornecedor.tipo}').customText(
                        fontSize: 42,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(
          height: 0.2,
          indent: 16.0,
          endIndent: 16.0,
        ),
        Container(
          margin: const EdgeInsets.only(
            right: 16.0,
            left: 16.0,
          ),
          height: (0.14).sizeHeightScreen(),
          width: (1.0).sizeWidthScreen(),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Botijão de 13kg').customText(
                            fontSize: 42,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(fornecedor.nome).customText(
                            fontSize: 42,
                          ),
                        ],
                      ),
                      Row(
                        textBaseline: TextBaseline.alphabetic,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        mainAxisAlignment: MainAxisAlignment.center,
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
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (cylinderQuantity > 0) {
                              setState(() {
                                cylinderQuantity--;
                                totalPrice =
                                    cylinderQuantity * fornecedor.preco;
                              });
                            }
                          },
                          child: Container(
                            width: (0.08).sizeWidthScreen(),
                            height: (0.08).sizeHeightScreen(),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.remove,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              'assets/prod_icon-gas.png',
                              height: (0.14).sizeHeightScreen(),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 16.0),
                              padding: const EdgeInsets.only(
                                top: 8,
                              ),
                              width: (0.06).sizeWidthScreen(),
                              height: (0.05).sizeHeightScreen(),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.orangeAccent,
                              ),
                              child: Text('$cylinderQuantity').customText(
                                fontSize: 46,
                                align: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              cylinderQuantity++;
                              totalPrice = cylinderQuantity * fornecedor.preco;
                            });
                          },
                          child: Container(
                            width: (0.08).sizeWidthScreen(),
                            height: (0.08).sizeHeightScreen(),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
