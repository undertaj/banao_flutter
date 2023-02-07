import 'package:banao_flutter/models/first_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FirstApiWidget extends StatelessWidget {

  final Future<List<Item>?> firstModel;

  const FirstApiWidget({required this.firstModel,super.key});

  @override
  Widget build(BuildContext context) {
    // return Padding(
    //   padding: const EdgeInsets.only(left : 8.0),
    //   child: SizedBox(
    //     width: 400,
    //     child: ListView.builder(
    //         itemCount: firstModel.items.length,
    //         itemBuilder: (BuildContext context, index) => Padding(
    //           padding: const EdgeInsets.all(15.0),
    //           child: Row(
    //             children: [
    //               SizedBox(
    //                 width: 250,
    //                 child: Card(
    //                   child: Column(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     mainAxisAlignment: MainAxisAlignment.center,
    //                     children: [
    //                       Image.asset("assets/program_pic1.png"),
    //                       Padding(
    //                         padding: const EdgeInsets.all(10.0),
    //                         child: Column(
    //                           mainAxisAlignment: MainAxisAlignment.start,
    //                           crossAxisAlignment: CrossAxisAlignment.start,
    //                           children: [
    //                             SizedBox(height: 9,),
    //                             Text( firstModel!.items[index].category,
    //                               style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 12),
    //                             ),
    //                             SizedBox(height: 12,),
    //                             Text(firstModel!.items[index].name,
    //                               style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),
    //                             ),
    //                             const SizedBox(height: 16,),
    //                             Row(
    //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                               children: [
    //                                 Text( DateFormat.yMMMd().format(firstModel!.items[index].createdAt),
    //                                   style: const TextStyle(color: Color(0xff6d747a), fontWeight: FontWeight.bold),
    //                                 ),
    //                                 (num == 1) ? const SizedBox(height: 0,) :
    //                                 ( num == 2 ?
    //                                 OutlinedButton(onPressed: null, style: OutlinedButton.styleFrom(side: BorderSide(color: Color(0xff598bed))), child: Text("Book", style: TextStyle(color: Colors.blue),),)
    //                                     : const Icon(Icons.lock) ),
    //                               ],
    //                             ),
    //                             SizedBox(height: 10,),
    //
    //                           ],
    //                         ),
    //                       )
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //               SizedBox(width: 15,)
    //             ],
    //           ),
    //         )
    //     ),
    //   ),
    // );
    return FutureBuilder(
      future: firstModel,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
              height: 327,
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
                            children: [
                              Image.asset("assets/program_pic1.png"),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
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
                                        Text( "${DateFormat.yMMMd().format(snapshot.data![index].createdAt)}\n${snapshot.data![index].lesson}",
                                          style: const TextStyle(color: Color(0xff6d747a), fontWeight: FontWeight.bold),
                                        ),
                                        OutlinedButton(onPressed: null, child: Text("Book", style: TextStyle(color: Colors.blue),))
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
