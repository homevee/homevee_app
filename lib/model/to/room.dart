class Room {
  final int id;
  final String name;
  final String icon;

  Room(this.id, this.name, this.icon);

  Room.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        icon = json['icon'];

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'name': name,
        'icon': icon,
      };
}