import 'package:flutter_bloc/flutter_bloc.dart';
import 'qr_event.dart';
import 'qr_state.dart';

class QRBloc extends Bloc<QREvent, QRState> {
  QRBloc() : super(QRInitial()) {
    on<QRScanned>(_onQRScanned);
    on<QRReset>(_onQRReset);
  }

  Future<void> _onQRScanned(QRScanned event, Emitter<QRState> emit) async {
    emit(QRLoading());

    try {
      // Simulate backend call
      await Future.delayed(const Duration(seconds: 1));

      if (event.scannedData.isEmpty) {
        throw Exception('Invalid QR code');
      }

      emit(QRLoaded(event.scannedData));
    } catch (e) {
      emit(QRError(e.toString()));
    }
  }

  void _onQRReset(QRReset event, Emitter<QRState> emit) {
    emit(QRInitial());
  }
}
