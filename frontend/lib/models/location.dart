class Location {
  final int? id;
  final String name;
  final String message;
  final double latitude;
  final double longitude;
  final double radius;
  final DateTime createdAt;
  final bool isActive;

  Location({
    this.id,
    required this.name,
    required this.message,
    required this.latitude,
    required this.longitude,
    required this.radius,
    required this.createdAt,
    this.isActive = true,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'],
      name: json['name'],
      message: json['message'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      radius: json['radius'],
      createdAt: DateTime.parse(json['createdAt']),
      isActive: json['isActive'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'message': message,
      'latitude': latitude,
      'longitude': longitude,
      'radius': radius,
      'createdAt': createdAt.toIso8601String(),
      'isActive': isActive,
    };
  }

  Location copyWith({
    int? id,
    String? name,
    String? message,
    double? latitude,
    double? longitude,
    double? radius,
    DateTime? createdAt,
    bool? isActive,
  }) {
    return Location(
      id: id ?? this.id,
      name: name ?? this.name,
      message: message ?? this.message,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      radius: radius ?? this.radius,
      createdAt: createdAt ?? this.createdAt,
      isActive: isActive ?? this.isActive,
    );
  }
} 