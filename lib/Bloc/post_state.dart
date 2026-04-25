abstract class PostState {}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostSuccess extends PostState {
  final String result;

  PostSuccess(this.result);
}

class PostError extends PostState {
  final String error;

  PostError(this.error);
}
