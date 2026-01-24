import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class QRRepository {
  final http.Client client;

  QRRepository(this.client);

  Future<String> checkIn(String qrData) async {
    final response = await client.post(
      Uri.parse('https://api.yourschool.edu/attendance/checkin'),
      headers: {
        'Authorization': 'Bearer TOKEN',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'qr_code': qrData}),
    );

    if (response.statusCode == 200) {
      return 'Check-in successful';
    } else {
      throw Exception('Invalid QR code');
    }
  }
}
