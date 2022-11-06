import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer_app/grocery_provider.dart';
import 'package:sizer_app/grocery_store_bloc.dart';
import 'package:sizer_app/grocery_store_cart.dart';
import 'package:sizer_app/grocery_store_list.dart';

const _backgroundColor = Color(0XFF6F5F2);
const cartBarHeight = 100.0;
const _panelTransition = Duration(milliseconds: 500);

class GroceryStoreHome extends StatefulWidget {
  @override
  State<GroceryStoreHome> createState() => _GroceryStoreHomeState();
}

class _GroceryStoreHomeState extends State<GroceryStoreHome> {
  final bloc = GroceryStoreBloc();

  void _onVerticalGesture(DragUpdateDetails details) {
    if (details.primaryDelta! < -7) {
      bloc.changeToCart();
    } else if (details.primaryDelta! > 12) {
      bloc.changeToNoramal();
    }
  }

  double? _getTopForWhitePanel(GroceryState state, Size size) {
    if (state == GroceryState.normal) {
      return -cartBarHeight + kToolbarHeight;
    } else if (state == GroceryState.cart) {
      return -(size.height - kToolbarHeight - cartBarHeight / 2);
    }
    return 0.0;
  }

  double? _getTopForBlackPanel(GroceryState state, Size size) {
    if (state == GroceryState.normal) {
      return size.height - cartBarHeight;
    } else if (state == GroceryState.cart) {
      return cartBarHeight / 2;
    }
    return 0.0;
  }

  double? _getTopForAppBar(GroceryState state, Size size) {
    if (state == GroceryState.normal) {
      return 0.0;
    } else if (state == GroceryState.cart) {
      return -cartBarHeight;
    }
    return 0.0;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GroceryProvider(
      bloc: bloc,
      child: AnimatedBuilder(
        animation: bloc,
        builder: (context, _) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.black,
              body: Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        AnimatedPositioned(
                          duration: _panelTransition,
                          curve: Curves.decelerate,
                          left: 0,
                          right: 0,
                          top: _getTopForWhitePanel(bloc.groceryState, size),
                          height: size.height - kToolbarHeight,
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(30)),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(30),
                                ),
                              ),
                              child: GroceryStoreList(),
                            ),
                          ),
                        ),
                        AnimatedPositioned(
                          duration: _panelTransition,
                          curve: Curves.decelerate,
                          left: 0,
                          right: 0,
                          top: _getTopForBlackPanel(bloc.groceryState, size),
                          height: size.height - kToolbarHeight,
                          child: GestureDetector(
                            onVerticalDragUpdate: _onVerticalGesture,
                            child: Container(
                              color: Colors.black,
                              child: Column(children: [
                                Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: AnimatedSwitcher(
                                    duration: _panelTransition,
                                    child: SizedBox(
                                      height: kToolbarHeight,
                                      child:
                                          bloc.groceryState ==
                                                  GroceryState.normal
                                              ? Row(
                                                  children: [
                                                    Text(
                                                      'Cart',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Expanded(
                                                      child:
                                                          SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      8.0),
                                                          child: Row(
                                                            children:
                                                                List.generate(
                                                              bloc.cart.length,
                                                              (index) =>
                                                                  Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        8.0),
                                                                child: Stack(
                                                                  children: [
                                                                    Hero(
                                                                      tag:
                                                                          'list_${bloc.cart[index].product.name}details',
                                                                      child:
                                                                          CircleAvatar(
                                                                        backgroundColor:
                                                                            Colors.white,
                                                                        backgroundImage: AssetImage(bloc
                                                                            .cart[index]
                                                                            .product
                                                                            .image
                                                                            .toString()),
                                                                      ),
                                                                    ),
                                                                    Positioned(
                                                                      child:
                                                                          CircleAvatar(
                                                                        radius:
                                                                            10,
                                                                        backgroundColor:
                                                                            Colors.red,
                                                                        child:
                                                                            Text(
                                                                          bloc.cart[index]
                                                                              .quantity
                                                                              .toString(),
                                                                          style:
                                                                              TextStyle(color: Colors.white),
                                                                        ),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    CircleAvatar(
                                                      backgroundColor:
                                                          Colors.yellow,
                                                      child: Text(bloc
                                                          .totalCartElement()
                                                          .toString()),
                                                    )
                                                  ],
                                                )
                                              : SizedBox.shrink(),
                                    ),
                                  ),
                                ),
                                Expanded(child: GroceryStoreCart()),
                              ]),
                            ),
                          ),
                        ),
                        AnimatedPositioned(
                          curve: Curves.decelerate,
                          duration: _panelTransition,
                          left: 0,
                          right: 0,
                          top: _getTopForAppBar(bloc.groceryState, size),
                          child: _AppBarGrocery(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _AppBarGrocery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      color: Colors.grey.shade200,
      child: Row(children: [
        BackButton(
          color: Colors.black,
        ),
        Expanded(
          child: Text('Fruit and vegetable',
              style: TextStyle(color: Colors.black)),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.settings))
      ]),
    );
  }
}
