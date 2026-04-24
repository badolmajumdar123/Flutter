import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'post_event.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<SubmitFormEvent>((event, emit) async {
      emit(PostLoading());

      try {
        final response = await http.post(
          Uri.parse('http://localhost:3000/api/users'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            "firstName": event.firstName,
            "lastName": event.lastName,
            "email": event.email,
            "password": event.password,
          }),
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          emit(PostSuccess("User created successfully"));
        } else {
          emit(PostError("Failed to create user"));
        }
      } catch (e) {
        emit(PostError(e.toString()));
      }
    });
  }

  get http => null;
}
