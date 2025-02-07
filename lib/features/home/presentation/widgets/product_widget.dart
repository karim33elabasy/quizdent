import 'package:flutter/material.dart';
import 'package:quizdent/features/home/data/models/product_model.dart';

class ProductWidget extends StatefulWidget {
  final ProductModel productModel;
  const ProductWidget({super.key,required this.productModel});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  bool like = false; // to toggle when user add to favourite
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double ratio = 0.4; // to determine the width of the widget depending on the screen width.

    togglingLike(){
      // toggling the add to favourites button with snack bar
      if(like == false){
        SnackBar itemAddedToCard = const SnackBar(
          content: Text("Item added to favourites."),
          duration: Duration(milliseconds: 500),
        );
        ScaffoldMessenger.of(context).showSnackBar(itemAddedToCard);
      }
      setState(() {
        like = !like;
      });
    }

    // Main container of the widget :
    return Container(
      width: width*ratio,
      height: width*ratio,
      padding: const EdgeInsets.all(5),
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.productModel.productImage)
        ),
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20)
      ),
      // Stack to add the like button and product details :
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: togglingLike,
              icon: Icon(
                like ? Icons.favorite : Icons.favorite_border,
                color: like ? Colors.red : Colors.black
              )
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.yellow,
              width: width*ratio,
              height: width*ratio*0.3,
              alignment: Alignment.center,
              child: FittedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(widget.productModel.productName, style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),maxLines: 1,),
                    Text("${widget.productModel.productPrice} EGP", style: const TextStyle(color: Colors.black, overflow: TextOverflow.ellipsis),maxLines: 1,),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );

  }
}
