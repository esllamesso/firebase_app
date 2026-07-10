import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/data/place_model.dart';

class PlaceRepository {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<PlaceModel>> getPlaces() async {
    final snapshot = await firestore.collection("places").get();
    return snapshot.docs.map((doc) => PlaceModel.fromJson(doc.data())).toList();
  }
}
