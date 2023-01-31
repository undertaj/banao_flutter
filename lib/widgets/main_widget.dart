
import 'package:banao_flutter/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainWidget extends StatelessWidget {
  final String category;

  const MainWidget({super.key, required this.category});

  final Map<String, List<List<dynamic>>> mapD = const {
    "Programs for you" : [
      ["LIFESTYLE", "A complete guide for your new born baby", "16 lessons", 1, "assets/program_pic1.png"],
      ["WORKING PARENTS", "Understanding of human behaviour", "12 lessons", 1, "assets/program_pic2.png"]
    ],
    "Events and experiences" : [
      ["BABYCARE", "Understanding of human behaviour", "13 Feb, Sunday", 2, "assets/third_pic.png"],
      ["BABYCARE", "Understanding of human behaviour", "13 Feb, Sunday", 2, "assets/third_pic.png"]
    ],
    "Lessons for you" : [
      ["BABYCARE", "Understanding of human behaviour", "3 min", 3, "assets/third_pic.png"],
      ["BABYCARE", "Understanding of human behaviour", "1 min", 3, "assets/third_pic.png"]
    ]
  };



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text( category, style: GoogleFonts.lora(textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 19, )),),
            Row(
              children: const [
                Text("View all", style:  TextStyle(fontSize: 14 ,fontWeight: FontWeight.bold, color: Color(0xff6d747a)),),
                IconButton(onPressed: null, icon: Icon(Icons.arrow_forward)),
              ],
            )
          ],
        ),
        SizedBox(height: 18,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              CardWidget(
                  a: mapD[category]![0][0],
                  b: mapD[category]![0][1],
                  c: mapD[category]![0][2],
                  num: mapD[category]![0][3],
                  image: mapD[category]![0][4],
                ),

              CardWidget(
                  a: mapD[category]![1][0],
                  b: mapD[category]![1][1],
                  c: mapD[category]![1][2],
                  num: mapD[category]![1][3],
                  image: mapD[category]![1][4],
                )

            ],
          ),
        ),


      ],


    );
  }
}
