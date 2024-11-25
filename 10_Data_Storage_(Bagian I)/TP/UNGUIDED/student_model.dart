class Student {
  final int? id;
  final String name;
  final String nim;
  final String address;
  final String hobby;

  Student({this.id, required this.name, required this.nim, required this.address, required this.hobby});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'nim': nim,
      'address': address,
      'hobby': hobby,
    };
  }
}
