import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AadhaarImagePicker extends StatefulWidget {
  const AadhaarImagePicker({Key? key}) : super(key: key);

  @override
  State<AadhaarImagePicker> createState() => _AadhaarImagePickerState();
}

class _AadhaarImagePickerState extends State<AadhaarImagePicker> {
  final ImagePicker _picker = ImagePicker();
  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // TextField(
        //     controller: TextEditingController(
        //         text: scannedData != null ? scannedData!.name : '')),
        image != null
            ? Image.file(
                image!,
                height: 200,
                width: 200,
              )
            : Container(),
        Center(
          child: ElevatedButton(
            onPressed: () async {
              var img = await _picker.getImage(source: ImageSource.camera);
              if (img == null) {
                return;
              }
              final temp = File(img.path);
              setState(() {
                image = temp;
              });

              // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
              //     "#ff6666", "Cancel", true, ScanMode.QR);
            },
            child: const Text("Scan"),
          ),
        ),
      ],
    ));
  }
}
