class UserData {
  UserData({
    required this.name,
    required this.age,
    required this.count,
  });

  final String name;
  final int age;
  final int count;

  factory UserData.fromJson(Map<String, Object?> json)=>UserData(
    name: json["name"] as String? ?? "",
    age: json["age"] as int? ?? 0,
    count: json["count"] as int? ?? 0,
  );
  @override
  String toString() {
    return '''
    name: $name, age: $age, count: $count
    ''';
  }
}
