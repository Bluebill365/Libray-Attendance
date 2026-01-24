abstract class QRState {}

class QRInitial extends QRState {}

class QRLoading extends QRState {}

class QRLoaded extends QRState {
  final String response;

  QRLoaded(this.response);
}

class QRError extends QRState {
  final String message;

  QRError(this.message);
}
