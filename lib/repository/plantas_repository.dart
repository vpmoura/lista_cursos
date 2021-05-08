import 'package:lista_cursos/models/planta_model.dart';

import 'database.dart';

class PlantasRepository {
  Future<List<PlantaModel>> findAllAsync() async {
    var db = Database();
    await db.createDatabase();

    List<PlantaModel> cursos = new List<PlantaModel>();

    if (db.created) {
      cursos = new List<PlantaModel>();
      cursos.add(
        new PlantaModel(
          id: 1,
          nome: 'Java',
          nivel: 'Básico',
          percentualConclusao: 0.7,
          preco: 599,
          conteudo:
              'Lorem ipsum dolor sit amet. Commodo blandit. Morbi commodo sed ante eu eleifend. Aliquam erat volutpat. Nam ullamcorper diam lectus, a dictum tellus pellentesque a. Nam velit ligula, porttitor ac dictum nec, commodo quis ante. Pellentesque luctus libero nulla, eu tristique erat iaculis eu.',
        ),
      );
      cursos.add(
        PlantaModel(
          id: 2,
          nome: 'C#',
          nivel: 'Básico',
          percentualConclusao: 0.25,
          preco: 399,
          conteudo:
              'Lorem ipsum dolor sit amet. Commodo blandit. Morbi commodo sed ante eu eleifend. Aliquam erat volutpat. Nam ullamcorper diam lectus, a dictum tellus pellentesque a. Nam velit ligula, porttitor ac dictum nec, commodo quis ante. Pellentesque luctus libero nulla, eu tristique erat iaculis eu.',
        ),
      );
      cursos.add(
        PlantaModel(
          id: 3,
          nome: 'Node JS',
          nivel: 'Básico',
          percentualConclusao: 0.9,
          preco: 799,
          conteudo:
              'Lorem ipsum dolor sit amet. Commodo blandit. Morbi commodo sed ante eu eleifend. Aliquam erat volutpat. Nam ullamcorper diam lectus, a dictum tellus pellentesque a. Nam velit ligula, porttitor ac dictum nec, commodo quis ante. Pellentesque luctus libero nulla, eu tristique erat iaculis eu.',
        ),
      );
      cursos.add(
        PlantaModel(
          id: 4,
          nome: 'GO Lang',
          nivel: 'Básico',
          percentualConclusao: 0.1,
          preco: 1799,
          conteudo:
              'Lorem ipsum dolor sit amet. Commodo blandit. Morbi commodo sed ante eu eleifend. Aliquam erat volutpat. Nam ullamcorper diam lectus, a dictum tellus pellentesque a. Nam velit ligula, porttitor ac dictum nec, commodo quis ante. Pellentesque luctus libero nulla, eu tristique erat iaculis eu.',
        ),
      );
      cursos.add(
        PlantaModel(
          id: 4,
          nome: 'GO Lang',
          nivel: 'Básico',
          percentualConclusao: 0.1,
          preco: 1799,
          conteudo:
              'Lorem ipsum dolor sit amet. Commodo blandit. Morbi commodo sed ante eu eleifend. Aliquam erat volutpat. Nam ullamcorper diam lectus, a dictum tellus pellentesque a. Nam velit ligula, porttitor ac dictum nec, commodo quis ante. Pellentesque luctus libero nulla, eu tristique erat iaculis eu.',
        ),
      );
    }

    return new Future.value(cursos);
  }
}
