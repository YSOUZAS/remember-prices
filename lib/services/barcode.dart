import 'package:barcode_scan/barcode_scan.dart';

class Barcode {
  static Future<String> scan() async {
    var result = await BarcodeScanner.scan();

    return result.rawContent;
  }
}
