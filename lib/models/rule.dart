// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class HomeRule {
  int id;
  String name;
  int? active;
  int? order;
  HomeRule({
    required this.id,
    required this.name,
    required this.active,
    required this.order,
  });

  HomeRule copyWith({
    int? id,
    String? name,
    int? active,
    int? order,
  }) {
    return HomeRule(
      id: id ?? this.id,
      name: name ?? this.name,
      active: active ?? this.active,
      order: order ?? this.order,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'active': active,
      'order': order,
    };
  }

  factory HomeRule.fromMap(Map<String, dynamic> map) {
    return HomeRule(
      id: map['id'] as int,
      name: map['name'] as String,
      active: map['active'] != null ? map['active'] as int : null,
      order: map['order'] != null ? map['order'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeRule.fromJson(String source) =>
      HomeRule.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HomeRule(id: $id, name: $name, active: $active, order: $order)';
  }

  @override
  bool operator ==(covariant HomeRule other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.active == active &&
        other.order == order;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ active.hashCode ^ order.hashCode;
  }
}
