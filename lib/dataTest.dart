class DataTestModel {
  String title = "";
  String author = "";
  String status = "";
  String check_out = "dd/mm/yy";

  DataTestModel(this.title,this.author,this.status);

  DataTestModel.fromJson(Map<String , dynamic> json)
    :title = json['title'],
    author = json['author'],
    check_out = json['check_out'],
    status = json['status'];

  Map<String,dynamic> toJson()=>{
    'title' : title,
    'author' : author,
    'status' : status,
    'check_out' : check_out,
  };

}

List<DataTestModel> testData = [
  DataTestModel("book1", "author1", "available"),
  DataTestModel("book2", "author2", "available"),
  DataTestModel("book3", "author3", "not available"),
  DataTestModel("book4", "author4", "available"),
  DataTestModel("book5", "author5", "not available"),
  DataTestModel("book6", "author6", "available"),
];