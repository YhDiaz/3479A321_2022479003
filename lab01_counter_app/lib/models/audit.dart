
class Audit {
  static int globalID = 0;

  int id;
  final String action;

  Audit({
    this.id = 0,
    required this.action
  })
  {
    globalID++;
    id = globalID;
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'action': action,
    };
  }

  @override
  String toString() {
    return 'Audit{id: $id, action: $action}';
  }

  // Map<String, Object?> toJson() => {
  //   'id': id,
  //   'action': action
  // };

  // Audit copy({
  //   int? id,
  //   String? action
  // }) =>
  //     Audit(
  //       id: id ?? this.id,
  //       action: action ?? this.action
  //     );

  // factory Audit.fromJson(Map<String, Object?> json) => Audit(
  //   id: json['id'] as int,
  //   action: json['action'] as String
  // );
}
