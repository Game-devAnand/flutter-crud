import 'package:flutter/material.dart';
import 'dataTest.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
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
                    padding: EdgeInsets.only(left: 8.0,top: 5.0),
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
                    children:[
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
                              onPressed:(){},
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
                    child:Container(
                      color: Colors.white38,
                      child: const TextField(
                        decoration: InputDecoration(
                          icon: Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Icon(Icons.search, color: Colors.black,size: 20,),
                          ),
                          hintText: 'Search',
                          contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                          border: InputBorder.none,
                        ),
                      ),
                    )
                  ),
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
            height: MediaQuery.of(context).size.height - 270,
            child: HomePageList(),
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

class _HomePageListState extends State<HomePageList> {
  @override
  Widget build(BuildContext context) {
    List demo = testData;
    return Card(
      child: ListView.builder(
          itemCount: demo.length,
          itemBuilder: (context,index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:[
                  Text("${demo[index].title}"),
                  Text("${demo[index].author}"),
                  Text("${demo[index].status}"),
                ],
              ),
            );
          }),
    );
  }
}
