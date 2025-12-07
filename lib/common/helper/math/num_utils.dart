class NumUtils {
  static int? toInt(dynamic v) =>
      v is int ? v : (v is double ? v.toInt() : null);

  static double? toDouble(dynamic v) =>
      v is num ? v.toDouble() : null;
}