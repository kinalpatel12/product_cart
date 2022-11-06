import 'package:flutter/material.dart';
import 'package:sizer_app/grocery_product.dart';

class GroceryStoreDetails extends StatefulWidget {
  const GroceryStoreDetails(
      {Key? key, required this.product, this.onProductAdded})
      : super(key: key);
  final GroceryProduct product;
  final VoidCallback? onProductAdded;

  @override
  State<GroceryStoreDetails> createState() => _GroceryStoreDetailsState();
}

class _GroceryStoreDetailsState extends State<GroceryStoreDetails> {
  String heroTag = '';

  void _addToCart(BuildContext context) {
    setState(() {
      heroTag = 'details';
    });
    widget.onProductAdded!();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Hero(
                    tag: 'list_${widget.product.name}_$heroTag',
                    child: Image.asset(
                      widget.product.image.toString(),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    widget.product.name.toString(),
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.product.weight.toString(),
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Spacer(),
                      Text(
                        '\$${widget.product.price.toString()}',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'About the product',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: Text(
                      widget.product.description.toString(),
                      maxLines: 4,
                      overflow: TextOverflow.fade,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.grey,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite_outline_rounded)),
                ),
                Expanded(
                  flex: 4,
                  child: MaterialButton(
                    onPressed: () => _addToCart(context),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    color: Colors.yellow,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text("Add to Cart"),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
