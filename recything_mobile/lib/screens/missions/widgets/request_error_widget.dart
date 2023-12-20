import 'package:flutter/material.dart';

class RequestErrorWidget extends StatelessWidget {
  final String errorMsg;
  final Future<void> Function() onRefresh;

  const RequestErrorWidget(
      {super.key, required this.errorMsg, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) =>
          RefreshIndicator(
              onRefresh: onRefresh,
              child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: ConstrainedBox(
                      constraints:
                          BoxConstraints(minHeight: constraints.maxHeight),
                      child: Center(child: Text(errorMsg))))),
    );
  }
}
