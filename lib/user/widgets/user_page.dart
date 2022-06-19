import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainvel/user/cubit/user_cubit.dart';

class UserPage extends StatelessWidget {
  UserPage._();

  static Route<String> route() =>
      MaterialPageRoute(builder: (_) => UserPage._());

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userCubit = context.read<UserCubit>();
    final user = userCubit.state.user;
    _nameController.text = user.name;
    _surnameController.text = user.surname;

    return Scaffold(
      appBar: AppBar(
        title: const Text('User profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'First name',
              ),
            ),
            TextField(
              controller: _surnameController,
              decoration: const InputDecoration(
                labelText: 'Surname',
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
              onPressed: () {
                userCubit.createUser(
                  _nameController.text,
                  _surnameController.text,
                );
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
