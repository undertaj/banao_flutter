import 'package:banao_flutter/models/first_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FirstApiWidget extends StatelessWidget {

  final FirstModel? firstModel;

  const FirstApiWidget(this.firstModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left : 70.0),
      child: SizedBox(
        width: 270,
        child: ListView.builder(
            itemCount: firstModel!.count,
            itemBuilder: (BuildContext context, index) => Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/program_pic1.png"),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 9,),
                          Text( firstModel!.items[index].category,
                            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          SizedBox(height: 12,),
                          Text( firstModel!.items[index].name,
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),
                          ),
                          const SizedBox(height: 16,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text( "${DateFormat.yMMMd().format(firstModel!.items[index].createdAt)} \nId : ${firstModel!.items[index].id}",
                                style: const TextStyle(color: Color(0xff6d747a), fontWeight: FontWeight.bold),
                              ),
                              OutlinedButton(onPressed: null, style: OutlinedButton.styleFrom(side: BorderSide(color: Color(0xff598bed))), child: Text("Watch", style: TextStyle(color: Colors.blue),),)
                              ,
                            ],
                          ),
                          SizedBox(height: 10,),

                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
        ),
      ),
    );
  }
}
