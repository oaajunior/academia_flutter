import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../page/home/widgets/item_fornecedor_home_widget.dart';
import '../../shop/shop_page.dart';
import '../../../model/fornecedor_model.dart';
import '../home_page.dart';

class ListFornecedorHomeWidget extends StatefulWidget {
  @override
  _ListFornecedorHomeWidgetState createState() =>
      _ListFornecedorHomeWidgetState();
}

class _ListFornecedorHomeWidgetState extends State<ListFornecedorHomeWidget> {
  List<Fornecedor> fornecedores;
  @override
  void initState() {
    super.initState();
    rootBundle.loadString('repository/dados.json').then((dados) {
      var listFornecedores = (json.decode(dados)) as List<dynamic>;

      setState(() {
        fornecedores = listFornecedores.map((fornecedor) {
          return Fornecedor.fromMap(fornecedor);
        }).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.86.sizeHeightScreen(),
      child: ListView.builder(
        padding: const EdgeInsets.only(
          top: 8,
          bottom: 8,
        ),
        itemCount: fornecedores?.length ?? 0,
        itemBuilder: (contex, index) {
          return GestureDetector(
            onTap: () => Navigator.of(context).pushNamed(
              ShopPage.routeName,
              arguments: fornecedores[index],
            ),
            child: ItemFornecedorHomeWidget(
              fornecedor: fornecedores[index],
            ),
          );
        },
      ),
    );
  }
}
