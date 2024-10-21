
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
}
