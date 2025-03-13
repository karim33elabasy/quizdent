import 'package:flutter/material.dart';
import 'package:quizdent/core/constants/app_colors.dart';
import 'package:quizdent/features/support/presentation/views/widgets/main_support_body.dart';

class MainSupportScreen extends StatelessWidget {
  const MainSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Support",style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 22,color: AppColors.white),),
        backgroundColor: Theme.of(context).brightness == Brightness.dark? AppColors.black:AppColors.primary,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back_rounded,color: Colors.white,)),
      ),
      body: const SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: MainSupportBody()
              ),
            ),
          ],
        ),
      ),
    );
  }
}
