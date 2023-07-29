class DataTestModel {
  String title = "";
  String author = "";
  String status = "";
  late String check_out;

  DataTestModel(this.title,this.author,this.status);

}

List<DataTestModel> testData = [
  DataTestModel("book1", "author1", "available"),
  DataTestModel("book2", "author2", "available"),
  DataTestModel("book3", "author3", "not available"),
  DataTestModel("book4", "author4", "available"),
  DataTestModel("book5", "author5", "not available"),
  DataTestModel("book6", "author6", "available"),
];