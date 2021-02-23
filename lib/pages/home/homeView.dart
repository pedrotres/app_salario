import 'package:app_salario/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';

import 'homeController.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final salarioController = TextEditingController();
  final inssController = TextEditingController();
  final irffController = TextEditingController();
  final salarioLiquidoController = TextEditingController();

  void calcular(double salario) {
    double inss = HomeController.controller.calculaINSS(salario);
    double irff = HomeController.controller.calcularIRRF(salario - inss);
    double salarioLiquido = salario - irff - inss;

    irffController.text = Utils.functions.roundDown(irff, 2).toString();
    inssController.text = Utils.functions.roundDown(inss, 2).toString();
    salarioLiquidoController.text =
        Utils.functions.roundDown(salarioLiquido, 2).toString();
    setState(() {});
    //print(irffController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('Cálculo do salário'),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 40,
            ),
            ListTile(
              leading: Text('R\$:'),
              title: Container(
                width: 20,
                height: 20,
                child: TextFormField(
                  controller: salarioController,
                  textAlign: TextAlign.start,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    RealInputFormatter(),
                  ],
                ),
              ),
            ),
            ListTile(
              title: RaisedButton(
                color: Colors.red,
                onPressed: () => calcular(
                    double.parse(salarioController.text.replaceAll('.', ''))),
                child: Text(
                  'CALCULAR',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ListTile(
              leading: Text('Salário Bruto: '),
              trailing: Text('R\$ ${salarioController.text}'),
            ),
            ListTile(
              leading: Text('INSS: '),
              trailing: Text(
                'R\$: ${inssController.text}',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            ListTile(
              leading: Text('IRRF: '),
              trailing: Text(
                'R\$: ${irffController.text}',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            ListTile(
              leading: Text('Salário líquido: '),
              trailing: Text('R\$: ${salarioLiquidoController.text}'),
            ),
          ],
        ));
  }
}
