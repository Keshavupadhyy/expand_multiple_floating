import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expand Multiple FAB',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ExpandableFabExample(),
    );
  }
}

class ExpandableFabExample extends StatefulWidget {
  @override
  _ExpandableFabExampleState createState() => _ExpandableFabExampleState();
}

class _ExpandableFabExampleState extends State<ExpandableFabExample>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expand Multiple FAB Example'),
      ),
      body: Center(
        child: Text(
          'Tap the FAB to expand multiple options.',
          style: TextStyle(fontSize: 18),
        ),
      ),
      floatingActionButton: Stack(
        alignment: Alignment.bottomRight,
        children: [
          // First FAB (Email)
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            right: 10,
            bottom: isExpanded ? 100 : 10,
            child: FloatingActionButton(
              onPressed: () {
                print("Email clicked");
              },
              child: Icon(Icons.email),
              backgroundColor: Colors.green,
            ),
          ),
          // Second FAB (Camera)
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            right: 10,
            bottom: isExpanded ? 160 : 10,
            child: FloatingActionButton(
              onPressed: () {
                print("Camera clicked");
              },
              child: Icon(Icons.camera_alt),
              backgroundColor: Colors.orange,
            ),
          ),
          // Third FAB (Phone)
          AnimatedPositioned(
            duration: Duration(milliseconds: 400),
            right: 10,
            bottom: isExpanded ? 220 : 10,
            child: FloatingActionButton(
              onPressed: () {
                print("Phone clicked");
              },
              child: Icon(Icons.phone),
              backgroundColor: Colors.purple,
            ),
          ),
          // Main FAB (to expand/collapse)
          FloatingActionButton(
            onPressed: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Icon(isExpanded ? Icons.close : Icons.menu),
          ),
        ],
      ),
    );
  }
}
