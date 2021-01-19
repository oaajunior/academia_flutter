import 'package:flutter/material.dart';
import '../../../model/fornecedor_model.dart';
import '../home_page.dart';

class ItemFornecedorHomeWidget extends StatelessWidget {
  final Fornecedor fornecedor;

  ItemFornecedorHomeWidget({this.fornecedor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (0.2).sizeHeightScreen(),
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RotatedBox(
                    quarterTurns: -1,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        color: Color(
                          int.parse('0xFF${fornecedor?.cor ?? 'FFFFFF'}'),
                        ),
                      ),
                      padding: const EdgeInsets.all(8),
                      width: constraints.maxHeight,
                      child: Text(fornecedor?.tipo ?? '').customText(
                        fontSize: 40,
                        align: TextAlign.center,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16.0,
                            bottom: 8.0,
                            top: 8.0,
                          ),
                          child: Text(fornecedor?.nome ?? '').customText(
                            fontSize: 40,
                          ),
                        ),
                        (fornecedor?.melhorPreco ?? false)
                            ? Container(
                                margin: const EdgeInsets.only(
                                  top: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.orangeAccent,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.label,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8,
                                        horizontal: 4,
                                      ),
                                      child: Text('Melhor Preço').customText(
                                        fontSize: 36,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container(),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8.0,
                        right: 16.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Nota').customText(
                            fontSize: 36,
                            color: Colors.grey,
                          ),
                          Text('Tempo Médio').customText(
                            fontSize: 36,
                            color: Colors.grey,
                          ),
                          Text('Preço').customText(
                            fontSize: 36,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 16.0,
                        left: 8.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Text('${fornecedor?.nota ?? 0.0}').customText(
                                fontSize: 64,
                                fontWeight: FontWeight.bold,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 0.035.sizeHeightScreen(),
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text('${fornecedor?.tempoMedio ?? 0}').customText(
                                fontSize: 64,
                                fontWeight: FontWeight.bold,
                              ),
                              Text('min').customText(
                                fontSize: 36,
                                align: TextAlign.end,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          Text('R\$ ${fornecedor?.preco?.toStringAsFixed(2)?.replaceFirst('.', ',') ?? 0.0}')
                              .customText(
                            fontSize: 64,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
