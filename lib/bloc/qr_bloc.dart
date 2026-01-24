import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:library_attendance/features/qr_checkin/bloc/data/qr_repository.dart';
import 'qr_event.dart';
import 'qr_state.dart';

class QRBloc extends Bloc<QREvent, QRState> {
  final QRRepository repository;

  QRBloc(this.repository) : super(const QRInitial()) {
    on<QRScanned>(_onQRScanned);
    on<QRReset>(_onQRReset);
  }

  Future<void> _onQRScanned(QRScanned event, Emitter<QRState> emit) async {
    emit(QRLoading());

    try {
      final response = await repository.checkIn(event.scannedData);
      emit(QRLoaded(response));
    } catch (e) {
      emit(QRError(e.toString()));
    }
  }

  Future<void> _onQRReset(QRReset event, Emitter<QRState> emit) async {
    emit(const QRInitial());
  }
}
