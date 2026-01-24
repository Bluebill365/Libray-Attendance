abstract class QREvent {
  const QREvent();
}

class QRScanned extends QREvent {
  final String scannedData;
  const QRScanned(this.scannedData);
}

class QRReset extends QREvent {
  const QRReset();
}
