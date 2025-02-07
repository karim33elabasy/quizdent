import 'package:flutter/material.dart';
import 'package:quizdent/features/home/data/models/product_model.dart';
import 'package:quizdent/features/home/presentation/widgets/product_widget.dart';

class HotOffersGridView extends StatelessWidget {
  const HotOffersGridView({super.key});

  @override
  Widget build(BuildContext context) {
    List <ProductModel> products=[];
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.4,
        crossAxisSpacing: 10
      ),
      itemBuilder: (context,counter)=> ProductWidget(productModel: products[counter]),
      itemCount: products.length,
    );
  }
}
