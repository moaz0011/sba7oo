// ignore_for_file: file_names, non_constant_identifier_names, duplicate_ignore

import 'package:cloud_firestore/cloud_firestore.dart';

class Speed {
  getdata() async {
    CollectionReference Clues =
        FirebaseFirestore.instance.collection('5*10');
    var data = await Clues.get();
    // ignore: non_constant_identifier_names
    List<String> CluesList=[];
    for (var element in data.docs) {
      CluesList.add(element['clue']);
    }
    return CluesList;
  }
}
