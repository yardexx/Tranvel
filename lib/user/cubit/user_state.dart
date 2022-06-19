part of 'user_cubit.dart';

enum UserStatus { guest, user, admin }

@JsonSerializable()
class UserState extends Equatable {
  const UserState({
    this.status = UserStatus.guest,
    User? user,
  }) : user = user ?? User.guest;

  factory UserState.fromJson(Map<String, dynamic> json) =>
      _$UserStateFromJson(json);

  Map<String, dynamic> toJson() => _$UserStateToJson(this);

  final UserStatus status;
  final User user;

  UserState copyWith({
    UserStatus? status,
    User? user,
  }) {
    return UserState(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [status, user];
}
