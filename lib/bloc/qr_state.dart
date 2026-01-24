abstract class QRState {
  const QRState();
}

class QRInitial extends QRState {
  const QRInitial();
}

class QRLoading extends QRState {
  const QRLoading();
}

class QRLoaded extends QRState {
  final dynamic response;
  const QRLoaded(this.response);
}

class QRError extends QRState {
  final String message;
  const QRError(this.message);
}
