import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> register(
      {required firstName,
      required lastName,
      required mobile,
      required email,
      required image,
      required username,
      required password}) async {
    // Make a POST request to your backend API to authenticate the user

    final response = await http.post(
      Uri.parse(''),
      body: {
        'userName': username,
        'password': password,
      },
    );
    emit(RegisterLoading());
    // print(response.body);
    if (response.statusCode == 200) {
      final data = response.body;
      final user = jsonDecode(data) as Map<String, dynamic>;
      print(user[' token']);
      SharedPreferences tn = await SharedPreferences.getInstance();
      tn.setString('access_token', user[' token']);
      emit(RegisterSuccess());
    } else {
      // Failed login
      print(response.statusCode);
      emit(RegisterFailure());
    }
  }
}
