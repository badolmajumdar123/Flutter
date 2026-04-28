import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'post_event.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    // 🔹 REGISTER
    on<SubmitFormEvent>((event, emit) async {
      emit(PostLoading());
      print(event.name);
      print(event.password);
      try {
        final response = await http.post(
          Uri.parse("http://localhost:4000/user/register"),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({"name": event.name, "password": event.password}),
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          emit(PostSuccess("User created successfully"));
        } else {
          emit(PostError("Failed: ${response.statusCode}"));
        }
      } catch (e) {
        emit(PostError(e.toString()));
      }
    });

    // 🔹 GET ALL USERS
    on<FetchUsersEvent>((event, emit) async {
      emit(PostLoading());

      try {
        final response = await http.get(
          Uri.parse("http://localhost:4000/user/getall"),
        );

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          emit(PostSuccess(data));
        } else {
          emit(PostError("Failed to fetch users"));
        }
      } catch (e) {
        emit(PostError(e.toString()));
      }
    });
  }
}
