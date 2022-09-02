
import 'package:flutter/material.dart';

import '../../../app_config/ui_assets.dart';

class EmptyView extends StatelessWidget {
  final String? message;
  final bool handleError;
  final Function? onErrorFunction;

  EmptyView({this.message, this.handleError = false, this.onErrorFunction});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 200,
          width: 200,
          // child: FlareActor(
          //   'UIAssets.emptyViewAnim',
          //   // animation:'Alarm',
          //   animation: 'idle',
          // ),
          // child: FlareActor(
          //   UIAssets.emptyViewAnim,
          //   // animation:'Alarm',
          //   animation: 'idle',
          // ),
        ),
        // SizedBox(height: 10,),
        Center(
            child: Text(
          message ?? 'Oooops ! ..',
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 14.0),
        )),
        // if (handleError==true) Center(child: ElevatedButton(onPressed:onErrorFunction,child: const Text('Retry Connection'),)) else Container(),
      ],
    );
  }
}
