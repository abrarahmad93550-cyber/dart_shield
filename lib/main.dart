import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const MaterialApp(home: ShieldScreen()));

class ShieldScreen extends StatefulWidget {
  const ShieldScreen({super.key});
  @override
  _ShieldScreenState createState() => _ShieldScreenState();
}

class _ShieldScreenState extends State<ShieldScreen> {
  bool isProtected = false;

  @override
  void initState() {
    super.initState();
    _loadStatus(); // ایپ شروع ہوتے ہی پرانا سٹیٹس لوڈ کرے
  }

  // سٹیٹس سیو کرنے کا فنکشن
  _toggleShield() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isProtected = !isProtected;
    });
    prefs.setBool('isProtected', isProtected);
  }

  // سٹیٹس لوڈ کرنے کا فنکشن
  _loadStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isProtected = prefs.getBool('isProtected') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _toggleShield,
              child: Icon(
                Icons.shield,
                size: 150,
                color: isProtected ? Colors.green : Colors.grey[400],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              isProtected ? "حفاظت فعال ہے" : "حفاظت غیر فعال ہے",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isProtected ? Colors.green : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

