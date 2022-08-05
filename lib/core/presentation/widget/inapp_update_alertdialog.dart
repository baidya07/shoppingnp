import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InAppUpdateAlertDialog extends StatelessWidget {
  final bool forceUpdate;
  final String appName;
  final String playStoreUrl;
  final String appStoreUrl;
  final String titlePrefix;
  final String description;
  final String updateButtonLabel;
  final String closeButtonLabel;
  final String ignoreButtonLabel;

  const InAppUpdateAlertDialog({
    required this.forceUpdate,
    required this.appName,
    required this.playStoreUrl,
    required this.appStoreUrl,
    required this.titlePrefix,
    required this.description,
    required this.updateButtonLabel,
    required this.closeButtonLabel,
    required this.ignoreButtonLabel,
  }) ;

  @override
  Widget build(BuildContext context) {
    /// Set up the Buttons
    final Widget closeAppButton = ElevatedButton(
      style:
      ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red),elevation: MaterialStateProperty.all(0),),
      onPressed: () => exit(0),
      child: Text(
        closeButtonLabel.toUpperCase(),
        style: const TextStyle(fontSize: 14),
      ),
    );

    final Widget ignoreButton = ElevatedButton(
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(Colors.white)),
      onPressed: () => Navigator.pop(context),
      child: Text(
        ignoreButtonLabel.toUpperCase(),
        style: const TextStyle(fontSize: 14, color: Colors.blue),
      ),
    );

    final Widget updateButton = ElevatedButton(
      style:
      ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(Colors.blue)),
      onPressed: () => launchUrl(Uri.parse(Platform.isAndroid ? playStoreUrl : appStoreUrl)),
      child: Text(updateButtonLabel.toUpperCase()),
    );

    return AlertDialog(
      title: Text(
          forceUpdate ? "$titlePrefix $appName" : "$titlePrefix $appName?"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'New version available',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 24.0),
          Text(description),
          const SizedBox(height: 24.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              if (forceUpdate) closeAppButton else ignoreButton,
              const SizedBox(width: 4.0),
              updateButton,
            ],
          ),
          const SizedBox(height: 8.0),
          // const Divider(),
          // const SizedBox(height: 8.0),
          // Image.asset(
          //  Platform.isAndroid ? 'assets/images/google_play.png' : 'assets/images/appstore.png',
          //   width: 120.0,
          // ),
        ],
      ),
    );
  }
}
