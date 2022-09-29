import 'package:banksimulator/components/editor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/transferencia.dart';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
      new TextEditingController();
  final TextEditingController _controladorCampoValor =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Transferências'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controlador: _controladorCampoNumeroConta,
              rotulo: 'Numero da conta',
              dica: '0000',
            ),
            Editor(
              controlador: _controladorCampoValor,
              rotulo: 'Valor',
              dica: '0.00',
              icone: Icons.monetization_on,
            ),
            ElevatedButton(
              onPressed: () => _criaTransferencia(context),
              child: Text('Confirmar'),
            )
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.parse(_controladorCampoNumeroConta.text);
    final double valor = double.parse(_controladorCampoValor.text);

    if (numeroConta != null && valor != null) {
      Transferencia trans = new Transferencia(valor, numeroConta);
      Navigator.pop(context, trans);
    }
  }
}
