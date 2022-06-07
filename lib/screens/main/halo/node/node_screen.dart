import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:balance/routes.dart';
import 'package:balance/screens/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class NodeScreen extends StatefulWidget
{
  @override
  _NodeScreenState createState() => _NodeScreenState();
}

class _NodeScreenState extends State<NodeScreen>
{
  @override
  Widget build(BuildContext context)
  {
    String nodeAddress;

    return Scaffold
    (
      body: CustomScrollView
      (
        slivers: <Widget>
        [
          SliverAppBar
          (
            backgroundColor: BColors.colorPrimary,
            flexibleSpace: FlexibleSpaceBar(title: Text('Node Status')),
            elevation: 2.0,
            forceElevated: true,
            pinned: true,
          ),
          SliverList
          (
            delegate: SliverChildListDelegate
            (
              <Widget>
              [
                /// Rating average
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 24.0, bottom:24),
                    child: Text(
                      'Not Connected',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 32.0)
                    ),
                  ),
                ),
                /// Rating chart lines
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget> [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>
                          [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Enter node\'s endpoint'
                                ),
                                onChanged: (text) => {
                                  nodeAddress = text
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                /// Rating chart lines
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget> [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>
                          [
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(primary: BColors.colorPrimary, textStyle: const TextStyle(fontSize: 20)),
                                onPressed: () {
                                  _makePostRequest(nodeAddress);
                                },
                                child: const Text('Upload Data'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

              ]
            ),
          ),
        ],
      ),
    );
  }
}

Future<bool> _makePostRequest(url_measurement) async {
  Map<String, String> headers = {"Content-type": "application/json"};
  print(url_measurement);

  try {
    String json = "{'name':'John Smith','email':'john@example.com'}";
    String filename = "example1.txt";
    print(url_measurement+"/upload/"+filename);
    print(jsonEncode(json));
    Response response = await post(url_measurement+"/upload/"+filename, headers: headers, body: jsonEncode(json)).timeout(Duration(seconds: 5));
    print(response.statusCode);

    if (response.statusCode == 200) {
      return true;
    } else {
      print("_SendingData.RawMeasurement: The server answered with: "+response.statusCode.toString());
      return false;
    }
  } on TimeoutException catch (_) {
    print("_SendingData.RawMeasurement: The connection dropped, maybe the server is congested");
    return false;
  } on SocketException catch (_) {
    print("_SendingData.RawMeasurement: Communication failed. The server was not reachable");
    return false;
  }
}