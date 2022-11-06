import 'package:flutter/material.dart';

class GroceryProduct {
  const GroceryProduct({
    this.price,
    this.name,
    this.description,
    this.image,
    this.weight,
  });
  final double? price;
  final String? name;
  final String? description;
  final String? image;
  final String? weight;
}

const groceryProducts = <GroceryProduct>[
  GroceryProduct(
      price: 8.30,
      name: 'Avacodo',
      description:
          'They are very healthy, nutritious, tasty and are an important part of our diet. There are thousands of fruits across the world like apple, mango, grapes, watermelon, papaya, etc.',
      image: 'assets/images/lemon.png',
      weight: '500g'),
  GroceryProduct(
      price: 11.00,
      name: 'Pineaple',
      description:
          'They are very healthy, nutritious, tasty and are an important part of our diet. There are thousands of fruits across the world like apple, mango, grapes, watermelon, papaya, etc.',
      image: 'assets/images/pine.png',
      weight: '500g'),
  GroceryProduct(
      price: 9.30,
      name: 'Apple',
      description:
          'They are very healthy, nutritious, tasty and are an important part of our diet. There are thousands of fruits across the world like apple, mango, grapes, watermelon, papaya, etc.',
      image: 'assets/images/apple.png',
      weight: '500g'),
  GroceryProduct(
      price: 9.30,
      name: 'Greps',
      description:
          'They are very healthy, nutritious, tasty and are an important part of our diet. There are thousands of fruits across the world like apple, mango, grapes, watermelon, papaya, etc.',
      image: 'assets/images/greps.png',
      weight: '500g'),
  GroceryProduct(
      price: 8.30,
      name: 'Avacodo',
      description: 'The good food fruits and very helthy',
      image: 'assets/images/lemon.png',
      weight: '500g'),
  GroceryProduct(
      price: 11.00,
      name: 'Pineaple',
      description: 'The good food fruits and very helthy',
      image: 'assets/images/pine.png',
      weight: '500g'),
  GroceryProduct(
      price: 9.30,
      name: 'Apple',
      description: 'The good food fruits and very helthy',
      image: 'assets/images/apple.png',
      weight: '500g'),
  GroceryProduct(
      price: 9.30,
      name: 'Greps',
      description: 'The good food fruits and very helthy',
      image: 'assets/images/greps.png',
      weight: '500g'),
];
