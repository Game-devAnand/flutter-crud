import 'package:flutter/material.dart';
import 'dataTest.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'add_and_edit_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black12,
        body: Column(
          children: [
            const AppBarWeb(),
            Container(
              child: const AppBodyHome(),
            ),
          ],
        ),
      ),
    );
  }
}

class AppBarWeb extends StatelessWidget {
  const AppBarWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        color: Colors.white,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              width: 600,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0, top: 5.0),
                    child: Icon(Icons.account_balance_sharp, size: 34),
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Home",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Books",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppBodyHome extends StatefulWidget {
  const AppBodyHome({Key? key}) : super(key: key);

  @override
  State<AppBodyHome> createState() => _AppBodyHomeState();
}

class _AppBodyHomeState extends State<AppBodyHome> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600,
      child: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Books",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      SizedBox(
                        width: 80,
                        height: 35,
                        child: Card(
                          color: Colors.black,
                          child: Center(
                            child: TextButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AddBook();
                                  },
                                );
                              },
                              child: const Text(
                                "Add",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.white38,
                        child: const TextField(
                          decoration: InputDecoration(
                            icon: Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                            hintText: 'Search',
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 10.0),
                            border: InputBorder.none,
                          ),
                        ),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text("TITLE"),
                      Text("AUTHOR"),
                      Text("STATUS"),
                      Text("CHECKED OUT"),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height - 270,
            child: const HomePageList(),
          )
        ],
      ),
    );
  }
}

class HomePageList extends StatefulWidget {
  const HomePageList({Key? key}) : super(key: key);

  @override
  State<HomePageList> createState() => _HomePageListState();
}
//TODO:LIST VIEW
class _HomePageListState extends State<HomePageList> {
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Card(
      child: StreamBuilder<List<DataModel>>(
        stream: fetchBooks(searchController.text),
        builder: (BuildContext context, AsyncSnapshot<List<DataModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Text('No books found');
          }

          List<DataModel> bookList = snapshot.data!;

          return ListView.builder(
            itemCount: bookList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(" ${bookList[index].title}"),
                    Text(" ${bookList[index].author}"),
                    Text(" ${bookList[index].status}"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          splashRadius: 15,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return UpdateBookPage(id: "1234");
                              },
                            );
                          },
                          icon: const Icon(Icons.edit, color: Colors.black),
                        ),
                        const SizedBox.square(dimension: 10),
                        IconButton(
                          splashRadius: 15,
                          onPressed: () {
                            //print("id is :${bookList[index]}");
                          },
                          icon: const Icon(Icons.delete, color: Colors.black),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },);
        },
      ),
    );
  }
}
