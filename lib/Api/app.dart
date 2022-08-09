import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class App {
  static Succ(String msg,BuildContext context){
    return showTopSnackBar(
      context,
      CustomSnackBar.success(
        message:
        msg,
      ),
    );
  }

  static Err(String msg,BuildContext context){
    return showTopSnackBar(
      context,
      CustomSnackBar.error(
        message:
        msg,
      ),
    );
  }

  static Loading(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
