import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/second_model.dart';



class SecondApiWidget extends StatelessWidget {

  final Future<List<Item2>?> secondModel;

  const SecondApiWidget({required this.secondModel,super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: secondModel,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            height: 359,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 250,
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset("assets/program_pic1.png"),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(

                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 9,),
                                  Text( snapshot.data![index].category,
                                    style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 12),
                                  ),
                                  SizedBox(height: 12,),
                                  Text(snapshot.data![index].name,
                                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),
                                  ),
                                  const SizedBox(height: 16,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text( "${DateFormat.yMMMd().format(snapshot.data![index].createdAt)}\nDuration: ${snapshot.data![index].duration} minutes",
                                        style: const TextStyle(color: Color(0xff6d747a), fontWeight: FontWeight.bold),
                                      ),
                                      snapshot.data![index].locked ?
                                          const Icon(Icons.lock_outline_rounded)
                                          : const Icon(Icons.lock_open_rounded) ,
                                    ],
                                  ),
                                  SizedBox(height: 10,),

                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 15,)
                  ],
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error} ++++");
        }
        return CircularProgressIndicator();
      },
    );
  }
}

