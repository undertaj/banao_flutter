
import 'package:banao_flutter/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class MainWidget extends StatelessWidget {
  final String category;

  const MainWidget({super.key, required this.category});

  final Map<String, List<List<dynamic>>> mapD = const {
    "Programs for you" : [
      ["LIFESTYLE", "A complete guide for your new born baby", "16 lessons", 1, "assets/program_pic1.png"],
      ["Working Parents", "Understanding of human behaviour", "12 lessons", 1, "assets/program_pic2.png"]
    ],
    "Events and experiences" : [
      ["Babycare", "Understanding of human behaviour", "13 Feb, Sunday", 2, "assets/third_pic.png"],
      ["Babycare", "Understanding of human behaviour", "13 Feb, Sunday", 2, "assets/third_pic.png"]
    ],
    "Lessons for you" : [
      ["Babycare", "Understanding of human behaviour", "3 min", 3, "assets/third_pic.png"],
      ["Babycare", "Understanding of human behaviour", "1 min", 3, "assets/third_pic.png"]
    ]
  };



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text( category, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, ),),
                const IconButton(onPressed: null, icon: Icon(Icons.arrow_forward))
              ],
            ),
            SizedBox(height: 18,),
            SingleChildScrollView(
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
        ),
      ),
    );
  }
}
