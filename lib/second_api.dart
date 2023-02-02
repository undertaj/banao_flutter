
import 'package:banao_flutter/widgets/first_api_widget.dart';
import 'package:banao_flutter/widgets/second_api_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'models/first_model.dart';
import 'models/second_model.dart';

class SecondApi extends StatefulWidget {
  const SecondApi({Key? key}) : super(key: key);

  @override
  State<SecondApi> createState() => _SecondApiState();
}

class _SecondApiState extends State<SecondApi> {
  SecondModel? secondModel;
  var _api = false;


  @override
  void initState() {
    super.initState();

    secondModel = null;
    _api = false;
    getApi2();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffeef3fd),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(onPressed: () => Navigator.pushNamed(context, "firstapi"), child: Text("API 1 Data", style: TextStyle(color: Colors.black87),)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(onPressed: () => getApi2(), child: Text("Get API 2 Data", style: TextStyle(color: Colors.black87),)),
          )
        ],
      ),
      body: _api ? SecondApiWidget(secondModel): null,
    );
  }


  void getApi2() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator())
    );

    //****************************************************
    Dio dio = Dio();

    try {
      var response = await dio.get('https://632017e19f82827dcf24a655.mockapi.io/api/lessons',);
      print(response.data);
      if (response.statusCode == 200) {
        secondModel = secondModelFromJson(response.toString());

        // print(await response.stream.bytesToString());
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(response.statusMessage.toString()),
          backgroundColor: Colors.deepPurple,));
        setState(() {
          _api = true;
        });
        Navigator.of(context, rootNavigator: true).pop();
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
}



