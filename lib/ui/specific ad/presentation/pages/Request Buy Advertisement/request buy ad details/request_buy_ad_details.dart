import 'package:flutter/material.dart';
import 'package:sheraa/custom_widgets/connectivity/network_indicator.dart';
import 'package:sheraa/custom_widgets/safe_area/page_container.dart';

class RequestBuyAdDetails extends StatefulWidget {
  const RequestBuyAdDetails({Key? key}) : super(key: key);

  @override
  State<RequestBuyAdDetails> createState() => _RequestBuyAdDetailsState();
}

class _RequestBuyAdDetailsState extends State<RequestBuyAdDetails> {
  @override
  Widget build(BuildContext context) {
    return NetworkIndicator(
      child: PageContainer(
        child: Scaffold(),
      ),
    );
  }
}
