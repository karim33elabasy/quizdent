import 'package:flutter/material.dart';

mySnackBar({required String text, required bool okBtn, required BuildContext context}){
  return SnackBar(
  content: Text(text),
  action: okBtn? SnackBarAction(label: 'Ok', onPressed: (){ScaffoldMessenger.of(context).clearSnackBars();}):null,
  );
}
