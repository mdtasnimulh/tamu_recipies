import 'package:flutter/material.dart';
import 'package:tamu_recipes/presentation/home/screens/random_recipe.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: RandomRecipe(),
    );
  }
}
