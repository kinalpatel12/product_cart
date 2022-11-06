import 'package:flutter/material.dart';
import 'package:sizer_app/grocery_provider.dart';

class GroceryStoreCart extends StatelessWidget {
  const GroceryStoreCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = GroceryProvider.of(context)!.bloc;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Cart',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: bloc.cart.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = bloc.cart[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage(
                                  bloc.cart[index].product.image.toString()),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              item.quantity.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'x',
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              item.product.name.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                            Spacer(),
                            Text(
                              '\$${(item.product.price! * item.quantity).toStringAsFixed(2)}',
                              style: TextStyle(color: Colors.white),
                            ),
                            IconButton(
                                onPressed: () {
                                  bloc.deleteProduct(item);
                                },
                                icon: Icon(
                                  Icons.delete_outline,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Text(
                "Total",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              Spacer(),
              Text(
                '\$${bloc.totalPriceElement()}',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 35),
          child: MaterialButton(
            minWidth: 350,
            onPressed: () => null,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            color: Colors.yellow,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text("Next"),
            ),
          ),
        ),
      ],
    );
  }
}
