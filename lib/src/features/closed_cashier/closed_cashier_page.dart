import 'package:flutter/material.dart';

class ClosedCashierPage extends StatelessWidget {
  const ClosedCashierPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Caixa Fechado",
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 60),
            ),
            SizedBox(
              height: 50,
            ),
            Divider(
              thickness: 2,
              indent: 100,
              endIndent: 100,
            ),
            SizedBox(height: 30),
            Text(
              "ABRIR CAIXA PARA INICIAR AS VENDAS",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 30),
            ),

          ],
        ),
      ),
    );
  }
}
