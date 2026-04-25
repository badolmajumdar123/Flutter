abstract class PostState {}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostSuccess extends PostState {
  final dynamic data;

  PostSuccess(this.data);
}

class PostError extends PostState {
  final String error;

  PostError(this.error);
}
