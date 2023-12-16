import 'dart:developer';
import 'dart:io';
import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:stoke_scanner/screen/Tiket.dart';

class QRViewExample extends StatefulWidget {
  const QRViewExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode? result;

  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (result != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Tiket(
                    Donner: '${result!.code}',
                  )),
        );
        reassemble();
      }
    });
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  if (result != null) Text('') else const Text('Scan a code'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      AnimatedIconButton(
                        size: 40,
                        onPressed: () async {
                          await controller?.toggleFlash();
                        },
                        duration: const Duration(milliseconds: 500),
                        splashColor: Colors.transparent,
                        icons: <AnimatedIconItem>[
                          AnimatedIconItem(
                            icon: Icon(Icons.flash_off,
                                color: Colors.purple.shade100),
                          ),
                          AnimatedIconItem(
                            icon: Icon(Icons.flash_on,
                                color: Colors.purple.shade100),
                          ),
                        ],
                      ),
                      AnimatedIconButton(
                        size: 40,
                        onPressed: () async {
                          await controller?.flipCamera();
                        },
                        duration: const Duration(milliseconds: 500),
                        splashColor: Colors.transparent,
                        icons: <AnimatedIconItem>[
                          AnimatedIconItem(
                            icon: Icon(Icons.camera_alt_rounded,
                                color: Colors.purple.shade100),
                          ),
                          AnimatedIconItem(
                            icon: Icon(Icons.camera_alt_sharp,
                                color: Colors.purple.shade100),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
