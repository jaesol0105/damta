import 'package:flutter/material.dart';

class SchoolInputPage extends StatelessWidget {
  final String kakaoId;

  const SchoolInputPage({super.key, required this.kakaoId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('임시 테스트 페이지'),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: Text(
          '테스트',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
