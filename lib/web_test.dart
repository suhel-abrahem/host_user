import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class UnityStorePage extends StatefulWidget {
  const UnityStorePage({super.key});

  @override
  State<UnityStorePage> createState() => _UnityStorePageState();
}

class _UnityStorePageState extends State<UnityStorePage> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..clearCache()
      ..loadRequest(
        Uri.parse(
          "https://hosta-13e66.web.app/?v=${DateTime.now().millisecondsSinceEpoch}",
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Virtual Store")),
      body: WebViewWidget(controller: controller),
    );
  }
}
