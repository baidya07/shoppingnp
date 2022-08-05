
import 'package:flutter/cupertino.dart';

import 'dialogs.dart';

class Observer<T> extends StatelessWidget {
  final Stream<T> stream;
  final Function onError;
  final Function onSuccess;

  const Observer(
      {required this.stream,
      required this.onSuccess,
      required this.onError,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return onSuccess(context, snapshot.data);
          }
          if (snapshot.hasError) {
            return onError(context, snapshot.error);
          } else {
            return const Center(child: CustomLoadingDialog());
          }
        });
  }
}
