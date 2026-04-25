abstract class PostEvent {}

class SubmitFormEvent extends PostEvent {
  final String enterText;
  final String firstName;

  SubmitFormEvent({required this.enterText, required this.firstName});
}
