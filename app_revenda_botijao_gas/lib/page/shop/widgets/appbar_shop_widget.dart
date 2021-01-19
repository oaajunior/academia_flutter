import 'package:flutter/material.dart';

import '../../home/home_page.dart';

class AppBarShopWidget extends StatelessWidget implements PreferredSizeWidget {
  final appBar = AppBar(
    title: Text('Selecionar Produtos').customText(
      fontSize: 56,
    ),
    actions: [
      PopupMenuButton<String>(
        icon: Text('?').customText(
          color: Colors.white,
          fontSize: 70,
        ),
        itemBuilder: (contexto) => [
          _popupMenuItem(
            option: 'optionSuporte',
            description: 'Suporte',
            hasCheckbox: false,
          ),
          _popupMenuItem(
            option: 'optionServico',
            description: 'Termos de Serviço',
            hasCheckbox: false,
          ),
        ],
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    return appBar;
  }

  @override
  Size get preferredSize => appBar.preferredSize;
}

final _filtro = {
  'optionMelhorAvaliacao': false,
  'optionMaisRapido': false,
  'optionMaisBarato': false,
};

Widget _popupMenuItem({String option, String description, bool hasCheckbox}) {
  return PopupMenuItem(
    value: option,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(description).customText(fontSize: 48),
        hasCheckbox
            ? Checkbox(
                onChanged: (value) => _filtro['optionMelhorAvaliacao'],
                value: _filtro['optionMelhorAvaliacao'],
              )
            : Container()
      ],
    ),
  );
}
