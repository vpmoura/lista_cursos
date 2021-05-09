import 'package:flutter/cupertino.dart';
import 'package:lista_cursos/models/planta_model.dart';

import 'database.dart';

class PlantasRepository {
  Future<List<PlantaModel>> findAllAsync() async {
    var db = Database();
    await db.createDatabase();

    List<PlantaModel> plantas = new List<PlantaModel>();

    if (db.created) {
      plantas = new List<PlantaModel>();
      plantas.add(
        new PlantaModel(
          id: 1,
          nome: 'Alho',
          estoque: '20%',
          percentualEstoque: 0.2,
          preco: "17 reais",
          conteudo:
              'O alho é uma parte de uma planta, o bulbo, que é muito utilizado na cozinha para temperar e condimentar os alimentos, mas que também pode ser usado como um medicamento natural para complementar o tratamento de vários problemas de saúde, como infecções por fungos ou pressão alta, por exemplo.',
          nomeBinomial: 'Allium sativum',
        ),
      );
      plantas.add(
        PlantaModel(
            id: 2,
            nome: 'Jaborandi',
            estoque: '10%',
            percentualEstoque: 0.1,
            preco: '8 reais',
            conteudo:
                'A planta e árvore de jaborandi servem como um excelente medicamento da natureza para diversos problemas de saúde. Um dos principais usos do chá com finalidade curativa é para glaucoma.',
            nomeBinomial: 'Pilocarpus microphyllus'),
      );
      plantas.add(
        PlantaModel(
            id: 3,
            nome: 'Valeriana',
            estoque: '60%',
            percentualEstoque: 0.6,
            preco: '275 reais',
            conteudo:
                'A valeriana é uma planta medicinal da família das valerianáceas, que também pode ser conhecida como valeriana, valeriana-das-boticas ou valeriana selvagem, e que é muito utilizada popularmente para tratar crises de insônia, ansiedade e agitação.',
            nomeBinomial: 'Valeriana officinalis'),
      );
      plantas.add(
        PlantaModel(
            id: 4,
            nome: 'Erva-doce',
            estoque: '40%',
            percentualEstoque: 0.4,
            preco: '40 reais',
            conteudo:
                'Esta planta é usada popularmente para gastrite, inchaço abdominal, má digestão, gases e dor de cabeça devido as propriedades analgésicas, anti-inflamatórias e antidispéptica. A erva-doce é usada também em produtos cosméticos e de perfumaria, podendo ser encontrada em diferentes formas, como extrato seco e óleo.',
            nomeBinomial: 'Foeniculum vulgare'),
      );
      plantas.add(
        PlantaModel(
            id: 4,
            nome: 'Macela-do-campo',
            estoque: '30%',
            percentualEstoque: 0.3,
            preco: '88 reais',
            conteudo:
                'A macela é uma planta medicinal muito utilizada como remédio caseiro para acalmar. As propriedades da macela incluem sua ação antiviral, antiespasmódica, anti-séptica, anti-inflamatória, calmante, antialérgica, adstringente, relaxante, tônica, digestiva e expectorante.',
            nomeBinomial: 'Achyrocline satureioides'),
      );
    }

    return new Future.value(plantas);
  }
}
