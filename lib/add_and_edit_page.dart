import 'package:flutter/material.dart';
import 'dataTest.dart';
import 'firebase_options.dart';

class AddBook extends StatefulWidget {
  @override
  _AddBookState createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  TextEditingController titleController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController checkoutController = TextEditingController();
  TextEditingController statusController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String idNo = generateUniqueBookId();
    print("new id ${idNo}");
    return AlertDialog(
      title: const Text('Add Book'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: authorController,
              decoration: const InputDecoration(labelText: 'Author'),
            ),
            TextField(
              controller: checkoutController,
              decoration: const InputDecoration(labelText: 'Check-out'),
            ),
            TextField(
              controller: statusController,
              decoration: const InputDecoration(labelText: 'Status'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel',style: TextStyle(color: Colors.black),),
        ),
        ElevatedButton(
          onPressed: () {
            if(titleController.text == "" && authorController.text == ""){
              print(">>>>>> NO input");
            }
            else{
              DataModel fbBook = DataModel(title: titleController.text, author: authorController.text, status: statusController.text, check_out: 'dd/mm/yy', ID: idNo);
              addBookFireBase(fbBook);
            }
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black
          ),
          child: const Text('Add',style: TextStyle(color: Colors.white),),
        ),
      ],
    );
  }
}



//update book window
class UpdateBookPage extends StatefulWidget {
  DataModel dataObj;
  UpdateBookPage({Key? key,required this.dataObj}) : super(key: key);

  @override
  State<UpdateBookPage> createState() => _UpdateBookPageState(dataObj);
}

class _UpdateBookPageState extends State<UpdateBookPage> {
  late DataModel dataObj;
  TextEditingController titleController = TextEditingController();

  TextEditingController authorController = TextEditingController();

  TextEditingController checkoutController = TextEditingController();

  TextEditingController statusController = TextEditingController();

  _UpdateBookPageState(this.dataObj);

  @override
  void initState() {
    titleController.text = dataObj.title;
    authorController.text = dataObj.author;
    checkoutController.text = dataObj.check_out;
    statusController.text = dataObj.status;
    super.initState();
  }

  //titleController
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Book'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Text('id #${widget.dataObj.ID}'),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: authorController,
              decoration: const InputDecoration(labelText: 'Author'),
            ),
            TextField(
              controller: checkoutController,
              decoration: const InputDecoration(labelText: 'Check-out'),
            ),
            TextField(
              controller: statusController,
              decoration: const InputDecoration(labelText: 'Status'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel',style: TextStyle(color: Colors.black),),
        ),
        ElevatedButton(
          onPressed: () {
            dataObj.title = titleController.text;
            dataObj.author = authorController.text;
            dataObj.status = statusController.text;
            dataObj.check_out = checkoutController.text;
            updateBook(dataObj);
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black
          ),
          child: const Text('Save',style: TextStyle(color: Colors.white),),
        ),
      ],
    );
  }
}

