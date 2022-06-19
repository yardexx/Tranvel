import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  const User({
    required this.name,
    required this.surname,
    this.isAdmin = false,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic>? toJson() => _$UserToJson(this);

  final String name;
  final String surname;
  final bool isAdmin;

  static const guest = User(
    name: 'Unknown',
    surname: '',
  );

  User copyWith({
    String? name,
    String? surname,
    bool? isAdmin,
  }) {
    return User(
      name: name ?? this.name,
      surname: surname ?? this.surname,
      isAdmin: isAdmin ?? this.isAdmin,
    );
  }
}
