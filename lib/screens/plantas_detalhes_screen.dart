import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lista_cursos/models/planta_model.dart';

class PlantasDetalhesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PlantaModel plantaModel = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(64, 75, 96, .9),
        title: Text(plantaModel.nome),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            labelValue('ID'),
            fieldValue(plantaModel.id.toString()),
            espaco(),
            labelValue('Nível'),
            fieldValue('Básico'),
            espaco(),
            labelValue('Preço'),
            fieldValue(plantaModel.preco.toString()),
            espaco(),
            labelValue('% Conclusão'),
            fieldValue('20%'),
            espaco(),
            labelValue('Conteúdo'),
            fieldValue(
                'Lorem ipsum dolor sit amet. Commodo blandit. Morbi commodo sed ante eu eleifend. Aliquam erat volutpat. Nam ullamcorper diam lectus, a dictum tellus pellentesque a. Nam velit ligula, porttitor ac dictum nec, commodo quis ante. Pellentesque luctus libero nulla, eu tristique erat iaculis eu.'),
            espaco(),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Tenho interesse!'),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(64, 75, 96, .9),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox espaco() => SizedBox(
        height: 16,
      );

  Widget labelValue(String _label) {
    return Text(
      '$_label:',
      textAlign: TextAlign.left,
      style: TextStyle(
        color: Color.fromRGBO(64, 75, 96, 1),
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
        fontSize: 18,
      ),
    );
  }

  Widget fieldValue(String _value) {
    return Text(
      _value,
      style: TextStyle(
        color: Color.fromRGBO(64, 75, 96, .9),
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w800,
        fontSize: 20,
      ),
    );
  }
}
