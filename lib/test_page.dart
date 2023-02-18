import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
      ),
      body: SafeArea(
        child: Center(
          child: Text("Test Page"),
        ),
      ),
    );
  }
}
