import 'package:flutter/material.dart';
import 'package:screen_utils/screen_utils.dart' as screenUtils;
import '../home_page.dart';

class AppBarHomeWidget extends StatelessWidget implements PreferredSizeWidget {
  final appBar = AppBar(
    title: Text('Escolha uma Revenda').customText(
      fontSize: 56,
      fontWeight: FontWeight.bold,
    ),
    actions: [
      PopupMenuButton<String>(
        icon: Icon(
          Icons.import_export,
          size: screenUtils.Adapt.screenHeightDp * 0.04,
        ),
        color: Colors.white,
        itemBuilder: (context) => [
          _popupMenuItem(
            option: 'optionMelhorAvaliacao',
            description: 'Melhor Avaliação',
            hasCheckbox: true,
          ),
          _popupMenuItem(
            option: 'optionMaisRapido',
            description: 'Mais Rápido',
            hasCheckbox: true,
          ),
          _popupMenuItem(
            option: 'optionMaisBarato',
            description: 'Mais Barato',
            hasCheckbox: true,
          ),
        ],
      ),
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
        Text(description).customText(
          fontSize: 48,
          color: Colors.blue,
        ),
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
