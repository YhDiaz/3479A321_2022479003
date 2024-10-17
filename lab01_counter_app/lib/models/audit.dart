
class Audit {
  final int id;
  final String action;

  Audit({
    required this.id,
    required this.action
  });

  Map<String, Object?> toJson() => {
    'id': id,
    'action': action
  };

  Audit copy({
    int? id,
    String? action
  }) =>
      Audit(
        id: id ?? this.id,
        action: action ?? this.action
      );

  factory Audit.fromJson(Map<String, Object?> json) => Audit(
    id: json['id'] as int,
    action: json['action'] as String
  );
}
