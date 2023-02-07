import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import './widgets/main_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'models/first_model.dart';
import 'models/second_model.dart';

class UiTask extends StatefulWidget {

  const UiTask({super.key});

  @override
  State<UiTask> createState() => _UiTaskState();
}

class _UiTaskState extends State<UiTask> {
  late Future<List<Item>?> firstModel;

  late Future<List<Item2>?> secondModel;


  @override
  void initState() {
    super.initState();


    secondModel = getApi2();
    firstModel = getApi1();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        //semanticLabel: MaterialLocalizations.of(context).anteMeridiemAbbreviation,

        surfaceTintColor: Color(0xff939ca3),
        child: Scaffold(),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(253),
        child: ColoredBox(
          color: const Color(0xffeef3fd),
          child: Padding(
            padding: const EdgeInsets.all(11.0),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBar(
                  elevation: 0,
                  actions: const [
                    IconButton(onPressed: null,
                        icon: Icon(CupertinoIcons.chat_bubble_2)),
                    IconButton(
                        onPressed: null, icon: Icon(CupertinoIcons.bell)),
                  ],
                  backgroundColor: const Color(0xffeef3fd),
                  title: null,
                ),
                // SizedBox(height: 100,),
                Text("Hello Priya!", style: GoogleFonts.lora(
                    textStyle: const TextStyle(
                      fontSize: 22, color: Color(0xff08090a),))),
                const Text("What do you wanna learn today?",
                  style: TextStyle(fontSize: 12, color: Color(0xff6d747a)),),
                GridView.count(
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 4,
                  primary: true,
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  children: [
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Color(0xff598bed))),
                        onPressed: null,
                        child: Row(
                          children: const[
                            Icon(Icons.book_rounded, color: Color(0xff598bed),),
                            SizedBox(width: 10,),
                            Text("DD Tracker", style: TextStyle(
                                color: Color(0xff598bed)),),
                          ],
                        )
                    ),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Color(0xff598bed))),
                        onPressed: null,
                        child: Row(
                          children: const[
                            Icon(
                              CupertinoIcons.question_circle_fill, color: Color(
                                0xff598bed),),
                            SizedBox(width: 10,),
                            Text("Get Help", style: TextStyle(
                                color: Color(0xff598bed)),),
                          ],
                        )
                    ),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Color(0xff598bed))),
                        onPressed: null,
                        child: Row(
                          children: const[
                            Icon(CupertinoIcons.book_fill, color: Color(
                                0xff598bed),),
                            SizedBox(width: 10,),
                            Text("Learn", style: TextStyle(
                                color: Color(0xff598bed)),),
                          ],
                        )
                    ),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Color(0xff598bed))),
                        onPressed: null,
                        child: Row(
                          children: const[
                            Icon(CupertinoIcons.graph_square_fill, color: Color(
                                0xff598bed),),
                            SizedBox(width: 10,),
                            Text("DD Tracker", style: TextStyle(
                                color: Color(0xff598bed)),),
                          ],
                        )
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        //)
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MainWidget(category: "Programs for you", model1: firstModel, model2: secondModel, num: 1,),
              MainWidget(category: "Events and experiences", model1: firstModel, model2: secondModel, num: 2,),
              MainWidget(category: "Lessons for you", model2: secondModel, model1: firstModel, num: 2,),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xff598bed),
        unselectedLabelStyle: TextStyle(color: Color(0xff6D747A)),
        //fixedColor: Color(0xff6D747A),
        unselectedItemColor: Color(0xff6D747A),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled), label: "Home",),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.book), label: "Learn"),
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_view_outlined), label: "Hub"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble), label: "Chat"),
          BottomNavigationBarItem(
              icon: Icon(Icons.circle_outlined), label: "Profile"),
        ],

      ),
    );
  }

  Future<List<Item2>?> getApi2() async {
    // showDialog(
    //     context: context,
    //     barrierDismissible: false,
    //     builder: (context) => Center(child: CircularProgressIndicator())
    // );

    //****************************************************
    Dio dio = Dio();

    try {
      var response = await dio.get(
        'https://632017e19f82827dcf24a655.mockapi.io/api/lessons',);
      print(response.data);
      if (response.statusCode == 200) {
        print(response.statusMessage);
        var jsonData = json.decode(response.toString());
        List<Item2>? programs = [];

        for (var p in jsonData["items"]) {
          print(p);
          Item2 program = Item2(
              id: p["id"].toString(),
              name: p["name"].toString(),
              category: p["category"].toString(),
              createdAt: DateTime.parse(p["createdAt"]),
              locked: p["locked"],
              duration: p["duration"]
          );
          programs.add(program);
        }
        for (var p in programs) {
          print("${p.createdAt}\n");
        }
        ScaffoldMessenger.of(context as BuildContext).showSnackBar(
            SnackBar(content: Text(response.statusMessage.toString()),
              backgroundColor: Colors.deepPurple,));
        return programs;

        // print(firstModel.items );
        // print(await response.stream.bytesToString());


        //Navigator.of(context).pop();
        // Navigator.pushNamed(context, MyRoutes.loginRoute);
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(response.statusMessage.toString()),
              backgroundColor: Colors.deepPurple,));
        return null;

        // print(response.reasonPhrase);
      }
    } on Exception catch (e) {
      print(e);
      throw Exception("Error occured!");
    }
  }


  Future<List<Item>?> getApi1() async {
    // showDialog(
    //     context: context,
    //     barrierDismissible: false,
    //     builder: (context) => Center(child: CircularProgressIndicator())
    // );
    //****************************************************
    Dio dio = Dio();

    try {
      var response = await dio.get(
        'https://632017e19f82827dcf24a655.mockapi.io/api/programs',);
      print(response.data);
      if (response.statusCode == 200) {
        print(response.statusMessage);
        var jsonData = json.decode(response.toString());
        List<Item> programs = [];

        for (var p in jsonData["items"]) {
          print(p);
          Item program = Item(id: p["id"].toString(),
              name: p["name"].toString(),
              category: p["category"].toString(),
              createdAt: DateTime.parse(p["createdAt"]),
              lesson: p["lesson"].toInt());
          programs.add(program);
        }
        for (var p in programs) {
          print("${p.createdAt}\n");
        }
        ScaffoldMessenger.of(context as BuildContext).showSnackBar(
            SnackBar(content: Text(response.statusMessage.toString()),
              backgroundColor: Colors.deepPurple,));
        return programs;

        // print(firstModel.items );
        // print(await response.stream.bytesToString());


        //Navigator.of(context).pop();
        // Navigator.pushNamed(context, MyRoutes.loginRoute);
      }
      else {
        ScaffoldMessenger.of(context as BuildContext).showSnackBar(
            SnackBar(content: Text(response.statusMessage.toString()),
              backgroundColor: Colors.deepPurple,));
        return null;

        // print(response.reasonPhrase);
      }
    } on Exception catch (e) {
      print(e);
      throw Exception("Error occured!");
    }
  }
}
