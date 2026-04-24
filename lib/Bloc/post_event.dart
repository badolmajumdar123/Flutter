abstract class PostEvent {}

class SubmitFormEvent extends PostEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  SubmitFormEvent({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });
}
