import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'post_event.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<SubmitFormEvent>((event, emit) async {
      emit(PostLoading());

      try {
        final response = await http.post(
          Uri.parse('http://10.0.2.2:3000/api/users'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            "text": event.enterText,
            "firstName": event.firstName,
          }),
        );

        print(response.statusCode);
        print(response.body);

        if (response.statusCode == 200 || response.statusCode == 201) {
          emit(PostSuccess("User created successfully"));
        } else {
          emit(PostError("Failed to create user"));
        }
      } catch (e) {
        print("ERROR: $e");
        emit(PostError(e.toString()));
      }
    });
  }
}
