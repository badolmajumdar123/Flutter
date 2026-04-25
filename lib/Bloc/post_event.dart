abstract class PostEvent {}

class SubmitFormEvent extends PostEvent {
  final String name;
  final String password;

  SubmitFormEvent({required this.name, required this.password});
}

class FetchUsersEvent extends PostEvent {}
