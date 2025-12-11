import 'package:flutter/material.dart';
import 'package:tamu_recipes/core/configs/theme/app_colors.dart';
import 'package:tamu_recipes/core/database/database_service.dart';
import 'package:tamu_recipes/data/models/meal/meal.dart';

class MealPlannerScreen extends StatefulWidget {
  const MealPlannerScreen({super.key});

  @override
  State<MealPlannerScreen> createState() => _MealPlannerScreenState();
}

class _MealPlannerScreenState extends State<MealPlannerScreen> {
  final DatabaseService _databaseService = DatabaseService.instance;
  String? _title = "";
  String? _description = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _addMealButton(),
      body: Column(
        children: [
          _mealList(),
        ],
      ),
    );
  }

  Widget _addMealButton() {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text("Add Meal"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  onChanged: (value) {
                    setState(() {
                      _title = value;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Title",
                  ),
                ),
                SizedBox(height: 12,),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      _description = value;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Description",
                  ),
                ),
                SizedBox(height: 16,),
                MaterialButton(
                  onPressed: () {
                    if (_title!.isEmpty || _description!.isEmpty) return;
                    _databaseService.addTask(
                      _title!,
                      _description!,
                    );
                    setState(() {
                      _title = "";
                      _description = "";
                      Navigator.pop(context);
                    });
                  },
                  color: AppColors.primary,
                  child: Text("Add", style: TextStyle(color: Colors.white),)
                ),
              ],
            ),
          )
        );
      },
      child: const Icon(Icons.add),
    );
  }

  Widget _mealList() {
    return Expanded(
      child: FutureBuilder(
          future: _databaseService.getMeal(),
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                Meal meal = snapshot.data![index];
                return ListTile(
                  title: Text(meal.title),
                  subtitle: Text(meal.description),
                  trailing: Checkbox(
                    value: false,
                    onChanged: (value) {}
                  ),
                );
              }
            );
          }
      ),
    );
  }
}
