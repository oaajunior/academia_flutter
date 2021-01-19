import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:screen_utils/screen_utils.dart' as screenUtils;
import 'dart:convert';

import '../../../model/endereco_model.dart';
import '../home_page.dart';

class AddressHomeWidget extends StatefulWidget {
  @override
  _AddressHomeWidgetState createState() => _AddressHomeWidgetState();
}

class _AddressHomeWidgetState extends State<AddressHomeWidget> {
  Endereco endereco;
  @override
  void initState() {
    super.initState();
    rootBundle.loadString('repository/enderecos.json').then((dados) {
      var listEnderecos = (json.decode(dados)) as List<dynamic>;
      setState(() {
        endereco = Endereco.fromMap(listEnderecos[0]);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenUtils.Adapt.screenWidthDp,
      height: 0.14.sizeHeightScreen(),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Botijões de 13kg em:').customText(
                    fontSize: 34,
                    color: Colors.grey,
                    align: TextAlign.left,
                  ),
                  Text('${endereco?.logradouro ?? ''}, ${endereco?.numero ?? ''} ${endereco?.complemento ?? ''}')
                      .customText(
                    fontSize: 48,
                    align: TextAlign.left,
                  ),
                  Text('${endereco?.bairro ?? ''}, ${endereco?.cidade ?? ''}, ${endereco?.estado ?? ''}')
                      .customText(
                    fontSize: 44,
                    color: Colors.grey,
                    align: TextAlign.left,
                  ),
                ],
              ),
              GestureDetector(
                child: Column(
                  children: [
                    Icon(
                      Icons.place,
                      color: Colors.blue,
                      size: 0.042.sizeHeightScreen(),
                    ),
                    Text('Mudar').customText(
                      fontSize: 36,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
