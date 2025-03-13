import 'package:flutter/material.dart';

class SideMenuItem extends StatelessWidget {
  final IconData iconData;
  final String title;
  final void Function() onTap;
  final Color? iconColor;
  const SideMenuItem({super.key, required this.iconData, required this.title, required this.onTap, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconData,color: iconColor,),
      title: Text(title,style: Theme.of(context).textTheme.titleLarge?.copyWith(),),
      onTap: (){
        Navigator.pop(context);
        onTap();
      },
    );
  }
}
