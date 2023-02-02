
import 'package:banao_flutter/widgets/first_api_widget.dart';
import 'package:banao_flutter/widgets/second_api_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'models/first_model.dart';
import 'models/second_model.dart';

class FirstApi extends StatefulWidget {
  const FirstApi({Key? key}) : super(key: key);

  @override
  State<FirstApi> createState() => _FirstApiState();
}

class _FirstApiState extends State<FirstApi> {
  FirstModel? firstModel;
  var _api1 = false;
  SecondModel? secondModel;


  @override
  void initState() {
    super.initState();
    firstModel = null;
    secondModel = null;
    _api1 = false;

  }



  void getApi1() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator())
    );

    //****************************************************
    Dio dio = Dio();

    try {
      var response = await dio.get('https://632017e19f82827dcf24a655.mockapi.io/api/programs',);
      print(response.data);
      if (response.statusCode == 200) {
        firstModel = firstModelFromJson(response.toString());

        // print(await response.stream.bytesToString());
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.statusMessage.toString()),
          backgroundColor: Colors.deepPurple,));
        setState(() {
          _api1 = true;
        });
        Navigator.of(context).pop();
        // Navigator.pushNamed(context, MyRoutes.loginRoute);
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.statusMessage.toString()),
          backgroundColor: Colors.deepPurple,));
        // print(response.reasonPhrase);
      }
      print(response.data);
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffeef3fd),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(onPressed: () => getApi1(), child: Text("Get API 1 Data", style: TextStyle(color: Colors.black87),)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(onPressed: () => Navigator.pushNamed(context, "secondapi"), child: Text("API 2 Data", style: TextStyle(color: Colors.black87),)),
            )
          ],
        ),
        body: _api1 ? FirstApiWidget(firstModel) : null,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}



