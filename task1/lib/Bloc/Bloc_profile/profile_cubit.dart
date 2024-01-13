import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task1/data/personal_information.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  String token = "";
  ProfileCubit() : super(ProfileInitial());
  Future<void> profileInfo() async {
    try {
      await SharedPreferences.getInstance().then((value) {
        token = value.getString("access_token")!;
      });
      print(token);
      var response = await http.post(
          Uri.parse('https://oras.orasweb.com/project/api/users/getUserByName'),
          headers: {
            // HttpHeaders.authorizationHeader: token,
            'Authorization': 'Bearer $token'
          },
          body: {
            "userName": "ahmad2"
          });
      emit(ProfileLoading());
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        print(data);
        Personal fetchPerson = Personal.fromJson(data);
        emit(ProfileSuccess(fetchPerson));
      } else {
        print(response.statusCode);
      }
    } catch (error) {
      print(error);
      emit(ProfileFailure());
    }
  }

  Future? upload(String imagePath, int id) async {
    String token = "";
    var ur = "https://oras.orasweb.com/project/api/users/saveImage";
    try {
      var postUri = Uri.parse(ur);
      http.MultipartRequest request = http.MultipartRequest("Post", postUri);
      request.headers['Authorization'] = 'Bearer $token';
      request.fields['id'] = "$id";
      http.MultipartFile multipartFile =
          await http.MultipartFile.fromPath('image', imagePath);
      request.files.add(multipartFile);
      http.StreamedResponse response = await request.send();
      print(response.statusCode);
    } catch (error) {
      print(error);
    }
  }
}
