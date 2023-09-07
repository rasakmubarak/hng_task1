import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GitHubView extends StatefulWidget {
  const GitHubView({super.key});

  @override
  State<GitHubView> createState() => _GitHubViewState();
}

class _GitHubViewState extends State<GitHubView> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://github.com/rasakmubarak'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AbdulRasak Mubarak'),
      ),
      body: WebViewStack(),
    );
  }
}

class WebViewStack extends StatefulWidget {
  const WebViewStack({super.key});

  @override
  State<WebViewStack> createState() => _WebViewStackState();
}

class _WebViewStackState extends State<WebViewStack> {
  var loadingPercentage = 0;
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            loadingPercentage = 0;
          });
        },
        onProgress: (progress) {
          setState(() {
            loadingPercentage = progress;
          });
        },
        onPageFinished: (url) {
          setState(() {
            loadingPercentage = 100;
          });
        },
      ))
      ..loadRequest(
        Uri.parse('https://github.com/rasakmubarak'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebViewWidget(
          controller: controller,
        ),
        if (loadingPercentage < 100)
          LinearProgressIndicator(
            value: loadingPercentage / 100.0,
          ),
      ],
    );
  }
}
