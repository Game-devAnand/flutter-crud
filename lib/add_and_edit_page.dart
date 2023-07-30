import 'package:flutter/material.dart';
import 'dataTest.dart';
import 'package:firebase_core/firebase_core.dart';
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
            // Add your code here to handle the data input by the user
            String title = titleController.text;
            String author = authorController.text;
            String checkout = checkoutController.text;
            String status = statusController.text;

            // For example, you can print the values
            // print('Title: $title');
            // print('Author: $author');
            // print('Check-out: $checkout');
            // print('Status: $status');

            // Close the alert box
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
class UpdateBookPage extends StatelessWidget {
  String id = "";
  UpdateBookPage({Key? key,required this.id}) : super(key: key);

  TextEditingController titleController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController checkoutController = TextEditingController();
  TextEditingController statusController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Book'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Text('id #$id'),
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
            // Add your code here to handle the data input by the user
            String title = titleController.text;
            String author = authorController.text;
            String checkout = checkoutController.text;
            String status = statusController.text;

            // Close the alert box
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

