import 'dart:typed_data';

import 'package:another_flushbar/flushbar.dart';
import 'package:faculty_project/shared/constants/constants.dart';
import 'package:faculty_project/shared/styles/colors_manager.dart';
import 'package:faculty_project/shared/styles/strings_manager.dart';
import 'package:faculty_project/shared/styles/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:ui' as ui;
import '../shared/constants/constants.dart';

import 'package:permission_handler/permission_handler.dart';
class GeneratorScreen extends StatefulWidget {
  const GeneratorScreen({Key? key}) : super(key: key);

  @override
  State<GeneratorScreen> createState() => _GeneratorScreenState();
}

class _GeneratorScreenState extends State<GeneratorScreen> {
  final _globalKey = GlobalKey();
  final _textController = TextEditingController();
  String _qrData = '';
  bool _isShowQR = false;
  bool _isSubmitted = false;

  String? get _errorMessage {
    String text = _textController.text.trim();
    if (text.isEmpty) {
      return AppStrings.empty;
    } else {
      return text;
    }
  }

  Future _capturePng() async {
    var devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

    //class extend RenderProxyBox
    RenderRepaintBoundary? boundary =
    _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary?;
    ui.Image image = await boundary!.toImage(pixelRatio: devicePixelRatio);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();

    // Request permissions if not already granted access
    if (!(await Permission.storage.status.isGranted)) {
      await Permission.storage.request();
    }

    await ImageGallerySaver.saveImage(
      Uint8List.fromList(pngBytes),
      name: AppStrings.qRCode,
      quality: 100,
    );

    Flushbar(
      message: AppStrings.download,
      flushbarPosition: FlushbarPosition.BOTTOM,
      duration: const Duration(milliseconds: 1000),
      margin: const EdgeInsets.all(AppPadding.p15),
      padding: const EdgeInsets.all(AppMargin.m15),
      borderRadius: BorderRadius.circular(10),
      icon: const Icon(
        Icons.download_done,
        color: Colors.green,
      ),
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.generate),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //بيعيد رسم الحدود
              RepaintBoundary(
                key: _globalKey,
                child: showQRcode(),
              ),
              //class Align extends SingleChildRenderObjectWidget
               Align(
                alignment: Alignment.center,
                child: Text(
                  AppStrings.id,
                  style: title,
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                decoration: const InputDecoration(
                    hintText: AppStrings.id,
                ),
                controller: _textController,
                //decoration: InputDecoration(
                //  errorText: _isSubmitted ? _errorMessage : null,
                // ),
                onChanged: (value) {
                  setState(() {});
                },
              ),
              const SizedBox(
                height: 30,
              ),
              buildButton(
                iconData: Icons.sync,
                text: AppStrings.generateQr,
                onPressed: () {
                  // FocusManager.instance.primaryFocus?.unfocus();
                  setState(() {
                    _isSubmitted = true;
                    //trim =>string
                    _qrData = _textController.text.trim();
                    if (_qrData.isEmpty) {
                      _isShowQR = false;
                    } else {
                      _isShowQR = true;
                    }
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              buildButton(
                  iconData: Icons.download,
                  text: AppStrings.downloadQR,
                  onPressed: _isShowQR ? _capturePng : null),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton({
    required IconData iconData,
    required String text,
    required onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(
        iconData,
        color: ColorManager.black,
      ),
      label: Text(
        text,
        style: title,
      ),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      ),
    );
  }

  Widget showQRcode() {
    return Container(
      width: 220,
      height: 220,
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient:  LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            ColorManager.primary,
            ColorManager.blue,
          ],
        ),
      ),
      alignment: Alignment.center,
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color:  ColorManager.white,
          // gradient:
        ),
        alignment: Alignment.center,
        child: AnimatedCrossFade(
          firstChild: const Text(AppStrings.createQR),
          secondChild: QrImage(
            data: _qrData,
            version: QrVersions.auto,
            errorStateBuilder: (ctx, error) => const Text(
              AppStrings.errorState,
              textAlign: TextAlign.center,
            ),
          ),
          duration: const Duration(milliseconds: 300),
          crossFadeState:
          _isShowQR ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _textController.dispose();
  }
}
