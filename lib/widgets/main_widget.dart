
import 'package:banao_flutter/models/first_model.dart';

import 'package:banao_flutter/widgets/first_api_widget.dart';
import 'package:banao_flutter/widgets/second_api_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/second_model.dart';

class MainWidget extends StatelessWidget {
  final String category;
  final Future<List<Item>?> model1;
  final Future<List<Item2>?> model2;
  final int num;

  const MainWidget({super.key, required this.category, required this.model1, required this.model2, required this.num});


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
        (num == 1) ? FirstApiWidget(firstModel: model1) : SecondApiWidget(secondModel: model2),
        //FirstApiWidget(firstModel: model)

        //SecondApiWidget(secondModel: model)
      ],


    );
  }
}
