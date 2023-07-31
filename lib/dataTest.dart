import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';

String generateUniqueBookId() {
  int timestamp = DateTime.now().microsecondsSinceEpoch;
  String bookId = timestamp.toString();
  return bookId;
}

class DataModel {
  String title = "";
  String author = "";
  String status = "";
  String check_out = "dd/mm/yy";
  String ID = "";

  DataModel({required this.title,required this.author,required this.status ,required this.check_out, required this.ID});

  DataModel.fromJson(Map<String , dynamic> json)
    :title = json['title'],
    author = json['author'],
    check_out = json['check_out'],
    status = json['status'],
    ID = json['id'];

  factory DataModel.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return DataModel(
        title : data['title'],
        author : data['author'],
        check_out : data['check_out'],
        status : data['status'],
        ID : data['id'],
    );
  }


  Map<String,dynamic> toJson()=>{
    'title' : title,
    'author' : author,
    'status' : status,
    'check_out' : check_out,
    'id' : ID,
  };

}


final CollectionReference booksCollection =
FirebaseFirestore.instance.collection('Books');

Future<void> addBookFireBase(DataModel book) async {
  print("book id is ${book.ID}");
  final CollectionReference booksCollection = FirebaseFirestore.instance.collection('Books');
  await booksCollection.doc(book.ID).set(book.toJson());
}



//getting
Stream<QuerySnapshot> getBookFireBase() {
  final CollectionReference booksCollection =
  FirebaseFirestore.instance.collection('Books');
  return booksCollection.snapshots();
}
//listening
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


//delete

Future<void> deleteBook(String id)async {
  final CollectionReference booksCollection = FirebaseFirestore.instance.collection('Books');
  await booksCollection.doc(id).delete();
}
