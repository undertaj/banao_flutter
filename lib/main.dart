import 'package:banao_flutter/widgets/main_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: const Drawer(
          //semanticLabel: MaterialLocalizations.of(context).anteMeridiemAbbreviation,

          surfaceTintColor: Color(0xff939ca3),
          child: Scaffold(),
        ),
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(250),
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
                      IconButton(onPressed: null, icon: Icon(CupertinoIcons.chat_bubble_2)),
                      IconButton(onPressed: null, icon: Icon(CupertinoIcons.bell)),
                      ],
                      backgroundColor: Color(0xffeef3fd),
                      title: null,
                    ),
                    // SizedBox(height: 100,),
                    Text("Hello Priya!", style: TextStyle(fontSize: 20, color: Color(0xff08090a),)),
                    Text("What do you wanna learn today?", style: TextStyle(fontSize: 12, color: Color(0xff6d747a)),),
                    GridView.count(

                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 4,
                      primary: true,
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      children: [
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(side: BorderSide(color: Color(0xff598bed))),
                            onPressed: null,
                            child: Row(
                              children: const[
                                Icon(Icons.book_rounded, color: Color(0xff598bed),),
                                SizedBox(width: 10,),
                                Text("DD Tracker",style: TextStyle(color: Color(0xff598bed)),),
                              ],
                            )
                        ),
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(side: BorderSide(color: Color(0xff598bed))),
                            onPressed: null,
                            child: Row(
                              children: const[
                                Icon(CupertinoIcons.question_circle_fill, color: Color(0xff598bed),),
                                SizedBox(width: 10,),
                                Text("Get Help",style: TextStyle(color: Color(0xff598bed)),),
                              ],
                            )
                        ),
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(side: BorderSide(color: Color(0xff598bed))),
                            onPressed: null,
                            child: Row(
                              children: const[
                                Icon(CupertinoIcons.book_fill, color: Color(0xff598bed),),
                                SizedBox(width: 10,),
                                Text("Learn",style: TextStyle(color: Color(0xff598bed)),),
                              ],
                            )
                        ),
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(side: BorderSide(color: Color(0xff598bed))),
                            onPressed: null,
                            child: Row(
                              children: const[
                                Icon(CupertinoIcons.graph_square_fill, color: Color(0xff598bed),),
                                SizedBox(width: 10,),
                                Text("DD Tracker",style: TextStyle(color: Color(0xff598bed)),),
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
              children: const [
                MainWidget(category: "Programs for you"),
                MainWidget(category: "Events and experiences"),
                MainWidget(category: "Lessons for you"),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedLabelStyle: TextStyle(color: Color(0xff6D747A)),
          fixedColor: Color(0xff6D747A),
          unselectedItemColor: Color(0xff6D747A),
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: "Home",

            ),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.book), label: "Learn"),
            BottomNavigationBarItem(icon: Icon(Icons.grid_view_outlined), label: "Hub"),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.chat_bubble), label: "Chat"),
            BottomNavigationBarItem(icon: Icon(Icons.circle_outlined), label: "Profile"),
          ],

        ),
      ),
    );
  }
}
