abstract class QREvent {}

class QRScanned extends QREvent {
  final String scannedData;

  QRScanned(this.scannedData);
}

class QRReset extends QREvent {}
