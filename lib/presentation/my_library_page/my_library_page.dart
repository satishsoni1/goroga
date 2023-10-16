import 'dart:async';
import 'dart:typed_data';

import 'package:usb_serial/transaction.dart';
import 'package:usb_serial/usb_serial.dart';

import 'controller/my_library_controller.dart';
import 'models/my_library_model.dart';
import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/widgets/app_bar/appbar_title.dart';
import 'package:goroga/widgets/app_bar/custom_app_bar.dart';

// ignore_for_file: must_be_immutable
class MyLibraryPage extends StatefulWidget {
  @override
  _MyLibraryState createState() => _MyLibraryState();
}

class _MyLibraryState extends State<MyLibraryPage> {
  MyLibraryController controller =
      Get.put(MyLibraryController(MyLibraryModel().obs));

  UsbPort? _port;
  String _status = "Idle";
  List<Widget> _ports = [];
  final List<Widget> _serialData = [];

  StreamSubscription<String>? _subscription;
  Transaction<String>? _transaction;
  UsbDevice? _device;

  final TextEditingController _textController = TextEditingController();

  Future<bool> _connectTo(device) async {
    _serialData.clear();

    if (_subscription != null) {
      _subscription!.cancel();
      _subscription = null;
    }

    if (_transaction != null) {
      _transaction!.dispose();
      _transaction = null;
    }

    if (_port != null) {
      _port!.close();
      _port = null;
    }

    if (device == null) {
      _device = null;
      setState(() {
        _status = "Disconnected";
      });
      return true;
    }

    _port = await device.create();
    if (await (_port!.open()) != true) {
      setState(() {
        _status = "Failed to open port";
      });
      return false;
    }
    _device = device;

    await _port!.setDTR(true);
    await _port!.setRTS(true);
    await _port!.setPortParameters(
        115200, UsbPort.DATABITS_8, UsbPort.STOPBITS_1, UsbPort.PARITY_NONE);

    _transaction = Transaction.stringTerminated(
        _port!.inputStream as Stream<Uint8List>, Uint8List.fromList([13, 10]));

    _subscription = _transaction!.stream.listen((String line) {
      setState(() {
        _serialData.add(Text(line));
        if (_serialData.length > 20) {
          _serialData.removeAt(0);
        }
      });
    });

    setState(() {
      _status = "Connected";
    });
    return true;
  }

  void _getPorts() async {
    _ports = [];
    List<UsbDevice> devices = await UsbSerial.listDevices();
    if (!devices.contains(_device)) {
      _connectTo(null);
    }

    print("****Test*****");
    print(devices);

    devices.forEach((device) {
      if (device.manufacturerName == "Roga") {
        _connectTo(device);
      }
    });

    setState(() {
      print(_ports);
    });
  }

  @override
  void initState() {
    super.initState();

    UsbSerial.usbEventStream!.listen((UsbEvent event) {
      _getPorts();
    });

    _getPorts();
  }

  @override
  void dispose() {
    super.dispose();
    _connectTo(null);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(80),
                // leadingWidth: 56,
                // leading: AppbarImage(
                //     height: getSize(32),
                //     width: getSize(32),
                //     svgPath: ImageConstant.imgVectorRedA700102x102,
                //     margin: getMargin(left: 24, top: 9, bottom: 10)),
                title: AppbarTitle(
                    text: "lbl_my_library".tr, margin: getMargin(left: 16)),
                actions: [
                  // AppbarImage(
                  //     height: getSize(28),
                  //     width: getSize(28),
                  //     svgPath: ImageConstant.imgSearch,
                  //     margin: getMargin(left: 24, top: 11, right: 12)),
                  // AppbarImage(
                  //     height: getSize(28),
                  //     width: getSize(28),
                  //     svgPath: ImageConstant.imgClock28x28,
                  //     margin: getMargin(left: 20, top: 11, right: 36))
                ]),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(top: 30, bottom: 30),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: Card(
                          elevation:
                              5, // Add some elevation for a shadow effect
                          margin:
                              EdgeInsets.all(16), // Add some margin for spacing
                          child: Container(
                            width:
                                double.infinity, // Adjust the width as needed
                            padding: EdgeInsets.all(
                                16), // Add padding inside the card
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('Status: $_status\n'),
                                  Text('info: ${_port.toString()}\n'),
                                  ListTile(
                                    title: TextField(
                                      controller: _textController,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Text To Send',
                                      ),
                                    ),
                                    trailing: ElevatedButton(
                                      onPressed: _port == null
                                          ? null
                                          : () async {
                                              if (_port == null) {
                                                return;
                                              }
                                              String data =
                                                  _textController.text + "\r";
                                              await _port!.write(
                                                  Uint8List.fromList(
                                                      data.codeUnits));
                                              _textController.text = "";
                                            },
                                      child: const Text("Send"),
                                    ),
                                  ),
                                  Text("Result Data",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge),
                                  ..._serialData,
                                  // Text('Response from API:'),
                                  // SizedBox(height: 20),
                                  // Obx(() {
                                  //   final responseData =
                                  //       controller.responseData;
                                  //   final errorMessage =
                                  //       controller.errorMessage;
                                  //   if (errorMessage.isNotEmpty) {
                                  //     return Text(
                                  //       errorMessage.value,
                                  //       style: TextStyle(color: Colors.red),
                                  //     );
                                  //   } else if (responseData.isNotEmpty) {
                                  //     return Text(
                                  //       responseData.toString(),
                                  //       style: TextStyle(fontSize: 16),
                                  //     );
                                  //   } else {
                                  //     return CircularProgressIndicator();
                                  //   }
                                  // }),
                                  // SizedBox(height: 20),
                                  // ElevatedButton(
                                  //   onPressed: controller.fetchData,
                                  //   child: Text('Fetch Data'),
                                  // ),
                                ],
                              ),
                            ),
                            // Column(
                            //                     mainAxisSize: MainAxisSize.min,
                            //                     mainAxisAlignment: MainAxisAlignment.center,
                            //                     children: [
                            //                       Text(
                            //                         'Title',
                            //                         style: TextStyle(
                            //                           fontSize: 18,
                            //                           fontWeight: FontWeight.bold,
                            //                         ),
                            //                       ),
                            //                       SizedBox(
                            //                           height:
                            //                               8), // Add some spacing between title and subtitle
                            //                       Text(
                            //                         'Subtitle',
                            //                         style: TextStyle(
                            //                           fontSize: 16,
                            //                           color: Colors.grey,
                            //                         ),
                            //                       ),
                            //                     ],
                            //                   ),
                          ),
                        ),
                      )
                    ]))));
  }
}
