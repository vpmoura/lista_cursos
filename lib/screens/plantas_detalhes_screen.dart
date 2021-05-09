import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lista_cursos/models/planta_model.dart';

class PlantasDetalhesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PlantaModel plantaModel = ModalRoute.of(context).settings.arguments;

    final levelIndicator = Container(
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            backgroundColor: Colors.white,
            value: plantaModel.percentualEstoque,
            valueColor: AlwaysStoppedAnimation(Color(0xFF00bf00)),
          ),
        ),
      ),
    );

    final precoPlanta = Container(
      padding: const EdgeInsets.all(7.0),
      decoration: new BoxDecoration(
        border: new Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Center(
        child: new Text(
          "R\$ " + plantaModel.preco.toString(),
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 70.0),
        SizedBox(height: 5.0),
        Text(
          plantaModel.nome,
          style: TextStyle(
            color: Colors.white,
            fontSize: 45.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 22.7),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: levelIndicator,
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  plantaModel.estoque,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: precoPlanta,
            ),
          ],
        ),
      ],
    );

    final bottomContent = Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            labelValue('Nome binomial'),
            fieldValue(plantaModel.nomeBinomial),
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
                  primary: Color(0xFF79d479),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    //);

    final topContent = Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Color(0xFF79d479),
          ),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        )
      ],
    );

    return Scaffold(
      body: Column(
        children: <Widget>[
          topContent,
          bottomContent,
        ],
      ),
    );
  }

  SizedBox espaco() => SizedBox(
        height: 20,
      );

  Widget labelValue(String _label) {
    return Text(
      '$_label:',
      textAlign: TextAlign.left,
      style: TextStyle(
        color: Color(0xFF6E6680),
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
        fontSize: 23,
      ),
    );
  }

  Widget fieldValue(String _value) {
    return Text(
      _value,
      style: TextStyle(
        color: Color.fromRGBO(64, 75, 96, .9),
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
        fontSize: 20,
      ),
    );
  }
}
