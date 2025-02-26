extension DynamicStringifier on Map<String, dynamic> {
  Map<String, String> dynamicToStringMap() => (this..removeWhere((key, val) => val == null)).map((key, val) => MapEntry(key, val.toString()));
}