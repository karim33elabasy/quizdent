import 'package:flutter/cupertino.dart';
import 'package:quizdent/features/home/data/models/product_model.dart';
import 'package:quizdent/features/home/presentation/widgets/product_widget.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    List <ProductModel> products=[];
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        horizontal: 10
      ),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context,counter)=> ProductWidget(productModel: products[counter]),
      separatorBuilder: (context,counter)=> const SizedBox(width: 10),
      itemCount: products.length,
    );
  }
}
