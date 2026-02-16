/// Data model for items/tasks
class Item {
  final String id;
  final String title;
  final String description;
  final DateTime dateCreated;

  Item({
    required this.id,
    required this.title,
    required this.description,
    required this.dateCreated,
  });

  /// Convert Item to JSON for storage
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dateCreated': dateCreated.toIso8601String(),
    };
  }

  /// Create Item from JSON
  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      dateCreated: DateTime.parse(json['dateCreated'] as String),
    );
  }

  /// Create a copy with modified fields
  Item copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? dateCreated,
  }) {
    return Item(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      dateCreated: dateCreated ?? this.dateCreated,
    );
  }

  @override
  String toString() =>
      'Item(id: $id, title: $title, dateCreated: $dateCreated)';
}
