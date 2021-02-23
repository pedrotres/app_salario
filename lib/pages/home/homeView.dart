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
  final salarioLiquido = TextEditingController();

  void calcular(double salario) {
    print(salario);
    inssController.text =
        HomeController.controller.calculaINSS(salario).toString();
    irffController.text = HomeController.controller
        .calcularIRRF(salario - HomeController.controller.calculaINSS(salario))
        .toString();
    print(inssController.text);
    salarioLiquido.text = (salario -
            double.parse(inssController.text) -
            double.parse(irffController.text))
        .toString();
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
              trailing: Text('R\$ 1500,00'),
            ),
            ListTile(
              leading: Text('INSS: '),
              trailing: Text('R\$: ${inssController.text}'),
            ),
            ListTile(
              leading: Text('IRRF: '),
              trailing: Text('R\$: ${irffController.text}'),
            ),
          ],
        ));
  }
}
