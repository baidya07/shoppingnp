/// Author:    Bibek Baidya
/// Created:   18.07.2022
/// Description:
/// (c) Copyright by supremeitsolutions.com.
///*/

import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'main_common.dart';

Future<void> main() async {
  await mainCommon();
  // WidgetsFlutterBinding.ensureInitialized();
  //
  // ByteData data = await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
  // SecurityContext.defaultContext.setTrustedCertificatesBytes(data.buffer.asUint8List());

  runApp(DevicePreview(
    enabled: true,
    builder: (context) => const Application(),
  ));
}
