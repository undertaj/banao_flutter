import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/second_model.dart';

class SecondApiWidget extends StatelessWidget {

  final SecondModel? secondModel;
  const SecondApiWidget(this.secondModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 70),
      child: SizedBox(
        width: 270,
        child: ListView.builder(
            itemCount: secondModel!.count,
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
                          Text( secondModel!.items[index].category,
                            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          SizedBox(height: 12,),
                          Text( secondModel!.items[index].name,
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),
                          ),
                          const SizedBox(height: 16,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text( "${DateFormat.yMMMd().format(secondModel!.items[index].createdAt)}\nDuration : ${secondModel!.items[index].duration}\nId : ${secondModel!.items[index].id}",
                                style: const TextStyle(color: Color(0xff6d747a), fontWeight: FontWeight.bold),
                              ),
                              (secondModel!.items[index].locked) ? const Icon(Icons.lock) : const Icon(Icons.lock_open_rounded),
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
