import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../bloc/qr_bloc.dart';
import '../bloc/qr_event.dart';
import '../bloc/qr_state.dart';

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({super.key});

  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? _controller;
  bool _hasScanned = false;

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    _controller = controller;

    controller.scannedDataStream.listen((scanData) {
      if (_hasScanned) return;

      final code = scanData.code;
      if (code == null || code.isEmpty) return;

      _hasScanned = true;
      _controller?.pauseCamera();

      context.read<QRBloc>().add(QRScanned(code));
    });
  }

  void _resetScanner() {
    _hasScanned = false;
    _controller?.resumeCamera();
    context.read<QRBloc>().add(QRReset());
  }

  @override
  Widget build(BuildContext context) {
    final scanArea =
        (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 200.0
        : 300.0;

    return Scaffold(
      appBar: AppBar(title: const Text('Library QR Scanner')),
      body: BlocListener<QRBloc, QRState>(
        listener: (context, state) {
          if (state is QRLoaded || state is QRError) {
            Future.delayed(const Duration(seconds: 2), _resetScanner);
          }
        },
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
                overlay: QrScannerOverlayShape(
                  borderColor: Colors.blue,
                  borderRadius: 10,
                  borderLength: 30,
                  borderWidth: 10,
                  cutOutSize: scanArea,
                ),
              ),
            ),
            const SizedBox(height: 16),
            BlocBuilder<QRBloc, QRState>(
              builder: (context, state) {
                if (state is QRInitial) {
                  return const Text('Scan a QR code to check in.');
                } else if (state is QRLoading) {
                  return const CircularProgressIndicator();
                } else if (state is QRLoaded) {
                  return Text(
                    'Check-in successful:\n${state.response}',
                    textAlign: TextAlign.center,
                  );
                } else if (state is QRError) {
                  return Text(
                    'Error: ${state.message}',
                    style: const TextStyle(color: Colors.red),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
