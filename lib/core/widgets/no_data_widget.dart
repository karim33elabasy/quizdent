import 'package:flutter/material.dart';
import 'package:quizdent/core/strings/strings_of_errors.dart';

class NoDataWidget extends StatelessWidget {
  final String? text;
  const NoDataWidget({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text?? StringsOfErrors.noDataAvailable,textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodyMedium,),
    );
  }
}
