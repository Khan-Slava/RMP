import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'pages/home_page.dart';

void main() async {
  // init the hive
  await Hive.initFlutter();

  // open a box
  var box = await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(primarySwatch: Colors.yellow),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(


          appBar: AppBar(
            title: Text("Персональный помощник"),
            bottom: const TabBar(
              tabs:<Widget> [
                Tab(text:"Задачи"),
                Tab(text:"Заметки"),
                Tab(text:"Таблицы"),
              ],
            ),

          ),
          body: TabBarView(
              children:<Widget>[
                const Center(child: const HomePage(),),
                const Center(child: const Text ("Notes()"),),
                const Center(child: Text("work is underway"),)
              ] ),
          drawer: Drawer(
            // Add a ListView to the drawer. This ensures the user can scroll
            // through the options in the drawer if there isn't enough vertical
            // space to fit everything.
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children:<Widget> [
              ],
            ),
          ),),),
    );
  }
}


class MyHomePage extends StatelessWidget{
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(


          appBar: AppBar(
            title: Text(title),
            bottom: const TabBar(
              tabs:<Widget> [
                Tab(text:"To Do"),
                Tab(text:"Notes"),
                Tab(text:"Table"),
              ],
            ),

          ),
          body: TabBarView(
              children:<Widget>[
                const Center(child: const HomePage(),),
                const Center(child: const Text ("Notes()"),),
                const Center(child: Text("work is underway"),)
              ] ),
          drawer: Drawer(
            // Add a ListView to the drawer. This ensures the user can scroll
            // through the options in the drawer if there isn't enough vertical
            // space to fit everything.
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children:<Widget> [
              ],
            ),
          ),),),
    );
  }
}
