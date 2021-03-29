import 'dart:convert';

import 'package:crypto/crypto.dart';

class CryptoUtil {
  String hash(String secret, Map<String, dynamic> message) {
    List<int> secretBytes = utf8.encode(secret);
    List<int> messageBytes = utf8.encode(jsonEncode(message));

    Hmac hmacSha256 = Hmac(sha256, secretBytes);
    Digest digest = hmacSha256.convert(messageBytes);
    return digest.toString();
  }
}

final CryptoUtil cryptoUtil = CryptoUtil();
