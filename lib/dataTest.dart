import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';

class DataModel {
  String title = "";
  String author = "";
  String status = "";
  String check_out = "dd/mm/yy";

  DataModel({required this.title,required this.author,required this.status ,required this.check_out});

  DataModel.fromJson(Map<String , dynamic> json)
    :title = json['title'],
    author = json['author'],
    check_out = json['check_out'],
    status = json['status'];

  factory DataModel.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return DataModel(
        title : data['title'],
        author : data['author'],
        check_out : data['check_out'],
        status : data['status']
    );
  }


  Map<String,dynamic> toJson()=>{
    'title' : title,
    'author' : author,
    'status' : status,
    'check_out' : check_out,
  };

}

List<DataModel> testData = [
  // DataModel("book1", "author1", "available"),
  // DataModel("book2", "author2", "available"),
  // DataModel("book3", "author3", "not available"),
  // DataModel("book4", "author4", "available"),
  // DataModel("book5", "author5", "not available"),
  // DataModel("book6", "author6", "available"),
];


final CollectionReference booksCollection =
FirebaseFirestore.instance.collection('Books');

Future<void> addBookFireBase(DataModel book) async {
  final CollectionReference booksCollection =
  FirebaseFirestore.instance.collection('Books');
  await booksCollection.add(book.toJson());
}

Stream<QuerySnapshot> getBookFireBase() {
  final CollectionReference booksCollection =
  FirebaseFirestore.instance.collection('Books');
  return booksCollection.snapshots();
}

Stream<List<DataModel>> fetchBooks(String searchTerm) {
  return FirebaseFirestore.instance
      .collection('Books')
      .where('title', isGreaterThanOrEqualTo: searchTerm)
      .snapshots()
      .map((QuerySnapshot querySnapshot) {
    List<DataModel> bookList = [];

    querySnapshot.docs.forEach((doc) {
      DataModel book = DataModel.fromSnapshot(doc);
      bookList.add(book);
    });
    return bookList;
  });
}
