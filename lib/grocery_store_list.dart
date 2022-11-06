import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer_app/grocery_details.dart';
import 'package:sizer_app/grocery_provider.dart';
import 'package:sizer_app/home_page.dart';

class GroceryStoreList extends StatelessWidget {
  const GroceryStoreList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = GroceryProvider.of(context)!.bloc;
    return Container(
      padding: const EdgeInsets.only(top: cartBarHeight),
      color: Colors.grey.shade100,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.8),
        itemCount: bloc.catalog.length,
        itemBuilder: (BuildContext context, int index) {
          final product = bloc.catalog[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 900),
                  pageBuilder: (context, animation, _) {
                    return FadeTransition(
                      opacity: animation,
                      child: GroceryStoreDetails(
                          product: product,
                          onProductAdded: () {
                            bloc.addProduct(product);
                          }),
                    );
                  },
                ),
              );
            },
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Hero(
                        tag: 'list_${product.name}',
                        child: Image.asset(
                          product.image.toString(),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Text(
                      '\$${product.price.toString()}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      product.name.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                    ),
                    Text(
                      product.weight.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
    /*return ListView.builder(
      padding: const EdgeInsets.only(top: cartBarHeight),
      itemCount: bloc.catalog.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 100,
          width: 100,
          color: Colors.primaries[index % Colors.primaries.length],
        );
      },
    );*/
  }
}
