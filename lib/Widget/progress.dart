import 'package:flutter/material.dart';

CircularProgress() {
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.only(top: 10.0),
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.green),
    ),
  );
}

LinearProgress() {
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.only(top: 10.0),
    child: LinearProgressIndicator(
      value: 0.5, // The progress value between 0.0 and 1.0
      backgroundColor: Colors.grey, // The background color of the progress bar
      valueColor: AlwaysStoppedAnimation<Color>(
          Colors.blue), // The color of the progress bar
    ),
  );
}
