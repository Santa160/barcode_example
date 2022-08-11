import 'package:barcode_example/model/data.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:xml/xml.dart';

class ScanQRCode extends StatefulWidget {
  const ScanQRCode({Key? key}) : super(key: key);

  @override
  State<ScanQRCode> createState() => _ScanQRCodeState();
}

class _ScanQRCodeState extends State<ScanQRCode> {
  PrintLetterBarcodeData? scannedData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan Aadhaar"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Form(
            child: Column(
          children: [
            TextFormField(
                controller: TextEditingController(
                    text: scannedData != null ? scannedData!.name : ''),
                decoration: const InputDecoration(hintText: 'Name')),
            TextFormField(
                controller: TextEditingController(
                    text: scannedData != null ? scannedData!.uid : ''),
                decoration: const InputDecoration(hintText: 'uid')),
            TextFormField(
                controller: TextEditingController(
                    text: scannedData != null ? scannedData!.gender : ''),
                decoration: InputDecoration(
                    hintText:
                        scannedData != null ? scannedData!.gender : 'gender')),
            TextFormField(
                controller: TextEditingController(
                    text: scannedData != null ? scannedData!.dob : ''),
                decoration: InputDecoration(
                    hintText: scannedData != null ? scannedData!.dob : 'DOB')),
            TextFormField(
                controller: TextEditingController(
                    text: scannedData != null ? scannedData!.loc : ''),
                decoration: InputDecoration(
                    hintText:
                        scannedData != null ? scannedData!.loc : 'Address')),
            TextButton(
                onPressed: () async {
                  String barcodeScanRes =
                      await FlutterBarcodeScanner.scanBarcode(
                          "#ff6666", "Cancel", true, ScanMode.QR);
                  var a = XmlDocument.parse(barcodeScanRes);

                  var e = a.getElement("PrintLetterBarcodeData");
                  if (e != null) {
                    var name = e.getAttribute("name");
                    var uid = e.getAttribute("uid");
                    var gender = e.getAttribute("gender");
                    var yob = e.getAttribute("yob");
                    var co = e.getAttribute("co");
                    var loc = e.getAttribute("loc");
                    var vtc = e.getAttribute("vtc");
                    var po = e.getAttribute("po");
                    var dist = e.getAttribute("dist");
                    var subdist = e.getAttribute("subdist");
                    var state = e.getAttribute("state");
                    var pc = e.getAttribute("pc");
                    var dob = e.getAttribute("dob");
                    var userData = PrintLetterBarcodeData(
                        uid: uid,
                        name: name,
                        gender: gender,
                        yob: yob,
                        co: co,
                        loc: loc,
                        vtc: vtc,
                        po: po,
                        dist: dist,
                        subdist: subdist,
                        state: state,
                        pc: pc,
                        dob: dob);
                    setState(() {
                      scannedData = userData;
                    });
                  }
                },
                child: const Text("Scan QR Code"))
          ],
        )),
      ),
    );
  }
}
