import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Item List App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ItemListScreen(),
    );
  }
}

class ItemListScreen extends StatelessWidget {
  final List<String> items = [
    'Pakistan',
    'India',
    'China',
    'Japan',
    'Germany',
    'Brazil',
    'Australia',
    'South Africa',
    'Canada',
    'Argentina',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Item List',
            style: TextStyle(
              fontSize: 25,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return buildItemContainer(
            context,
            item,
                () => showTapSnackBar(context, item),
          );
        },
      ),
    );
  }

  Widget buildItemContainer(BuildContext context, String item, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: buildListTile(item, onTap),
    );
  }

  Widget buildListTile(String item, VoidCallback onTap) {
    return ListTile(
      contentPadding: const EdgeInsets.all(15.0),
      title: Text(
        item,
        style: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  void showTapSnackBar(BuildContext context, String item) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Tapped on $item'),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
