import 'package:flutter/material.dart';

class AboutEnterpriseView extends StatelessWidget {
  const AboutEnterpriseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('TokenLab')),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: const Center(
            child: Text(
              'Somos uma empresa de inovação digital que tem como '
              'principal propósito transformar positivamente o'
              ' mundo através da tecnologia. ', style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.normal
            ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
}
