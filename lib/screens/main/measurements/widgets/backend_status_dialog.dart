
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:balance/floor/measurement_database.dart';
import 'package:balance/model/measurement.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

/// Show a dialog to ask the user if he wants to close the app during the test.
///
/// This method return a [Future] of [bool] used by the method [didPopRoute]
/// to know if the app should be closed or not.
Future<bool> showBackendStatusDialog(BuildContext context, bool valid, int id) {
  if (valid)
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'test_backend_ok_title'.tr(),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
        content: Padding(
          padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
          child: Text(
            'test_backend_ok_txt'.tr(),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.justify,
          )
        ),
        actions: [
          // Stop the test and close the app
          FlatButton(
            onPressed: () {
              // Close the dialog and the app
              Navigator.pop(context, false);
            },
            child: Text('close'.tr()),
          ),
        ],
      )
    );
  else
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('test_backend_wrong_title'.tr()),
          content: Text('test_backend_wrong_txt'.tr()),
          actions: [
            Row(
              children: <Widget>[
                // Try sending measurement
                FlatButton(
                  onPressed: () async {
                    // Close the dialog and the app
                    Navigator.pop(context, await _makePostRequest(id));
                  },
                  child: Text('Ritenta invio'),
                ),
              ]
            ),
          ],
        )
    );
}

Future<bool> _makePostRequest(measurementId) async {
  // set up POST request arguments
  String url_measurement = 'https://www.balancemobile.it/api/v1/db/measurement';
  //String url_measurement = 'http://www.dev.balancemobile.it/api/v1/db/measurement';
  Map<String, String> headers = {"Content-type": "application/json"};

  final database = await MeasurementDatabase.getDatabase();
  var measurement = await database.measurementDao.findMeasurementById(measurementId);

  try {
    Measurement newMeasurement = Measurement.sent(measurement, true);
    Response response = await post(url_measurement, headers: headers, body: jsonEncode(newMeasurement)).timeout(Duration(seconds: 5));

    if (response.statusCode == 200) {
      await database.measurementDao.updateMeasurement(newMeasurement);
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