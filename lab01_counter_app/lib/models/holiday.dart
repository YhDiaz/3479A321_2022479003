
class Holiday {
  final String name;
  final String date;
  final bool cantWork;
  final String type;

  Holiday({
    required this.name,
    required this.date,
    required this.cantWork,
    required this.type,
  }) {
    print('-------- DEBUG ---------\nname: $name,\ndate: $date,\ncant work: $cantWork,\ntype: $type');
  }

  factory Holiday.fromJson(Map<String, dynamic> json) {
    return Holiday(
      name: json['nombre'],
      date: json['fecha'],
      cantWork: json['irrenunciable'] == "1",
      type: json['tipo']
    );
  }
}
