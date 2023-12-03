import 'package:cloud_firestore/cloud_firestore.dart';


class Gusse {
  Future<List<Map<String, dynamic>>> getData() async {
    CollectionReference gusseThePlayer =
        FirebaseFirestore.instance.collection('gusseThePlayer');

    var data = await gusseThePlayer.get();
    // ignore: non_constant_identifier_names
    List<Map<String, dynamic>> PlayerData = [];


    for (int i = 0; i < data.docs.length; i++) {
      String playerName = data.docs[i]['playerName'];
      List<dynamic> playerList = data.docs[i]['clue'];

      Map<String, dynamic> playerDataMap = {
        'playerName': playerName,
        'clue': playerList,
      };

      PlayerData.add(playerDataMap);
    }


    return PlayerData;
  }
}

