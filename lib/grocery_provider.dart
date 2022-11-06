import 'package:flutter/material.dart';
import 'package:sizer_app/grocery_product.dart';
import 'package:sizer_app/grocery_store_bloc.dart';

class GroceryProvider extends InheritedWidget {
  final GroceryStoreBloc bloc;
  final Widget child;

  GroceryProvider({required this.bloc, required this.child})
      : super(child: child);

  static GroceryProvider? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<GroceryProvider>();
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
