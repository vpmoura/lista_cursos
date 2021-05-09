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
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              labelValue('Nome binomial'),
              fieldValue(plantaModel.nomeBinomial),
              espaco(),
              labelValue('Estoque'),
              fieldValue(plantaModel.estoque),
              espaco(),
              labelValue('Preço(kg)'),
              fieldValue(plantaModel.preco),
              espaco(),
              labelValue('Descrição'),
              fieldValue(plantaModel.conteudo),
              espaco(),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    var mensagem =
                        'Interesse na planta ${plantaModel.nome} registrado com sucesso';
                    Navigator.pop(context, mensagem);
                  },
                  child: Text('Tenho interesse!'),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(64, 75, 96, .9),
                  ),
                ),
              ),
            ],
          ),
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
