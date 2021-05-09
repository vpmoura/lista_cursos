import 'package:flutter/material.dart';
import 'package:lista_cursos/models/planta_model.dart';
import 'package:lista_cursos/repository/plantas_repository.dart';

class PlantasScreen extends StatefulWidget {
  @override
  _PlantasScreenState createState() => _PlantasScreenState();
}

class _PlantasScreenState extends State<PlantasScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF79d479),
        title: Text(
          "Plantas medicinais",
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder<List<PlantaModel>>(
        future: PlantasRepository().findAllAsync(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return buildListView(snapshot.data);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  ListView buildListView(List<PlantaModel> plantas) {
    return ListView.builder(
      itemCount: plantas == null ? 0 : plantas.length,
      //itemCount: cursos.length,
      itemBuilder: (BuildContext ctx, int index) {
        return cardPlanta(plantas[index]);
      },
    );
  }

  Card cardPlanta(PlantaModel planta) {
    return Card(
      elevation: 12.0,
      margin: new EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 6.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF79d479),
        ),
        child: Padding(
          padding: const EdgeInsets.all(7.5),
          child: ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                border: new Border(
                  right: new BorderSide(
                    width: 1.0,
                    color: Colors.white24,
                  ),
                ),
              ),
              child: Icon(
                Icons.autorenew,
                color: Colors.white,
              ),
            ),
            title: Text(
              planta.nome,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            subtitle: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.white,
                      value: planta.percentualEstoque,
                      valueColor: AlwaysStoppedAnimation(Color(0xFF00bf00)),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      'Estoque ' + planta.estoque,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.white,
              size: 30.0,
            ),
            onTap: () async {
              var mensagemRetorno = await Navigator.pushNamed(
                context,
                '/plantas_detalhes',
                arguments: planta,
              );
              print('Mensagem de retorno: ${mensagemRetorno}');
            },
          ),
        ),
      ),
    );
  }
}
