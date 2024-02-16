import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DetailArticleController extends GetxController {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getDataArticle(String docId) async {
    DocumentReference article = firestore.collection("article").doc(docId);
    return article.get();
  }
}
