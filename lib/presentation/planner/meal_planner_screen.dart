import 'package:flutter/material.dart';
import 'package:tamu_recipes/core/configs/theme/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/meal_cubit.dart';
import 'bloc/meal_state.dart';

class MealPlannerScreen extends StatefulWidget {
  const MealPlannerScreen({super.key});

  @override
  State<MealPlannerScreen> createState() => _MealPlannerScreenState();
}

class _MealPlannerScreenState extends State<MealPlannerScreen> {
  String _title = '';
  String _description = '';

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MealCubit>();

    return Scaffold(
      floatingActionButton: _addMealButton(cubit),
      body: BlocBuilder<MealCubit, MealState>(
        builder: (context, state) {
          if (state is MealLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is MealFailure) {
            return Center(child: Text(state.error));
          }

          if (state is MealLoaded) {
            if (state.meals.isEmpty) {
              return const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.set_meal_outlined, size: 48, color: Colors.grey),
                    SizedBox(height: 12),
                    Text(
                      'No meals added yet 🍽️\nTap + to add one.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              );
            }

            return ListView.builder(
              itemCount: state.meals.length,
              itemBuilder: (context, index) {
                final meal = state.meals[index];
                return ListTile(
                  title: Text(meal.title),
                  subtitle: Text(meal.description),
                  trailing: Checkbox(
                    value: meal.status == 1,
                    onChanged: (value) {
                      cubit.updateMealStatus(
                        meal.id,
                        value == true ? 1 : 0,
                      );
                    },
                  ),
                  onLongPress: () => cubit.deleteMeal(meal.id),
                );
              },
            );
          }

          return const SizedBox();
        },
      ),
    );
  }

  Widget _addMealButton(MealCubit cubit) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text("Add Meal"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  onChanged: (v) => _title = v,
                  decoration: const InputDecoration(hintText: "Title"),
                ),
                const SizedBox(height: 12),
                TextField(
                  onChanged: (v) => _description = v,
                  decoration: const InputDecoration(hintText: "Description"),
                ),
                const SizedBox(height: 16),
                MaterialButton(
                  color: AppColors.primary,
                  onPressed: () {
                    if (_title.isEmpty || _description.isEmpty) return;
                    cubit.addMeal(_title, _description);
                    Navigator.pop(context);
                  },
                  child: const Text("Add",
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
