import 'package:flutter/material.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Campo: '),
          const SizedBox(height: 10),
          TextField(),
          SizedBox(height: 25),

          Text('Campo 2: '),
          TextField(),

          SizedBox(height: 25),

          ElevatedButton(onPressed: () {}, child: const Text('Botão')),
        ],
      ),
    );
  }
}
