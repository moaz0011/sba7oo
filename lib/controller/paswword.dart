import 'package:cloud_firestore/cloud_firestore.dart';

class Password{

  getdata() async {
        // ignore: unused_local_variable
        CollectionReference passwordChallenge =
        FirebaseFirestore.instance.collection('passwordChalleange');
        var data = await passwordChallenge.get();
        List<Map<String, dynamic>> Q=[];
        for (var element in data.docs) {
                String playerName = element['playerName'];
                
      String imageURL = element['imageURL'];

      // ignore: unused_local_variable
      Map<String, dynamic> playerDataMap = {
        'playerName': playerName,
        'imageURL':imageURL,
      };
      Q.add(playerDataMap);
        }
        return Q;
  }
}