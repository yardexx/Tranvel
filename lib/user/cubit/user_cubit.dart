import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:trainvel/user/models/models.dart';

part 'user_state.dart';

part 'user_cubit.g.dart';

class UserCubit extends HydratedCubit<UserState> {
  UserCubit() : super(const UserState());

  void createUser(String name, String surname) {
    emit(
      state.copyWith(
        status: UserStatus.user,
        user: state.user.copyWith(
          name: name,
          surname: surname,
        ),
      ),
    );
  }

  void promoteToAdmin() {
    emit(
      state.copyWith(
        status: UserStatus.admin,
        user: state.user.copyWith(
          isAdmin: true,
        ),
      ),
    );
  }

  void demoteFromAdmin() {
    emit(
      state.copyWith(
        status: UserStatus.admin,
        user: state.user.copyWith(
          isAdmin: false,
        ),
      ),
    );
  }

  @override
  UserState? fromJson(Map<String, dynamic> json) => UserState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(UserState state) => state.toJson();
}
