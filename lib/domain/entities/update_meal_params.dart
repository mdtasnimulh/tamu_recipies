import 'dart:ffi';

class UpdateMealParams {
  final int id;
  final int status;

  UpdateMealParams({
    required this.id,
    required this.status,
  });
}