import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  Future<void> login({required username, required password}) async {
    // Make a POST request to your backend API to authenticate the user
    final response = await http.post(
      Uri.parse('https://oras.orasweb.com/project/api/login'),
      body: {
        'userName': username,
        'password': password,
      },
    );
    emit(LoginLoading());
    //print(response.body);
    if (response.statusCode == 200) {
      final token = response.body;
      final decodedToken = JwtDecoder.decode(token);
      final userId = decodedToken[' token'];
      print(userId);
      //  final expirationDate = decodedToken['exp'];
      emit(LoginSuccess());
    } else {
      // Failed login
      print(response.statusCode);
      emit(LoginFailure());
    }
  }
}
