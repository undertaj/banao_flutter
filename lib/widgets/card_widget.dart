import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String a;
  final String b;
  final String c;
  final String image;
  final int num;

  const CardWidget({super.key, required this.a, required this.b, required this.c, required this.num, required this.image});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 250,
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(image),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 9,),
                      Text( a,
                        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      SizedBox(height: 12,),
                      Text( b,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),
                      ),
                      const SizedBox(height: 16,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text( c,
                            style: const TextStyle(color: Color(0xff6d747a), fontWeight: FontWeight.bold),
                          ),
                          (num == 1) ? const SizedBox(height: 0,) :
                          ( num == 2 ?
                          OutlinedButton(onPressed: null, style: OutlinedButton.styleFrom(side: BorderSide(color: Color(0xff598bed))), child: Text("Book", style: TextStyle(color: Colors.blue),),)
                              : const Icon(Icons.lock) ),
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
    );
  }
}
