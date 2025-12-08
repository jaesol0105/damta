import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      body: ElevatedButton(
        onPressed: () {
          context.push("/post");
        },
        child: Text("게시판"),
      ),
    );
  }
}
