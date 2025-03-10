import 'package:flutter/material.dart';

class NoDataWidget extends StatelessWidget {
  final String? text;
  const NoDataWidget({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text?? "No data available!",textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodyMedium,),
    );
  }
}
