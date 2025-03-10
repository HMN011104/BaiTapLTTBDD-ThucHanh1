import 'package:flutter/material.dart';

void main() {
  runApp(AgeCheckerApp());
}

class AgeCheckerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AgeCheckerScreen(),
    );
  }
}

class AgeCheckerScreen extends StatefulWidget {
  @override
  _AgeCheckerScreenState createState() => _AgeCheckerScreenState();
}

class _AgeCheckerScreenState extends State<AgeCheckerScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  String result = "";

  void checkAge() {
    String name = nameController.text;
    int? age = int.tryParse(ageController.text);

    if (name.isEmpty || age == null) {
      setState(() {
        result = "Vui lòng nhập đầy đủ và đúng thông tin!";
      });
      return;
    }

    String category;
    if (age > 65) {
      category = "Người già";
    } else if (age >= 6 && age <= 65) {
      category = "Người lớn";
    } else if (age >= 2 && age < 6) {
      category = "Trẻ em";
    } else {
      category = "Em bé";
    }

    setState(() {
      result = "$name thuộc nhóm: $category";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("THỰC HÀNH 01")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Họ và tên"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Tuổi"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: checkAge,
              child: Text("Kiểm tra"),
            ),
            SizedBox(height: 20),
            Text(
              result,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
