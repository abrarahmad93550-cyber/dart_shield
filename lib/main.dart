import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: FilterPage()));

class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final TextEditingController _controller = TextEditingController();
  String _result = "";

  void _checkContent() {
    String text = _controller.text.toLowerCase();
    
    // یہاں مزید الفاظ بڑھا دیے گئے ہیں
    List<String> blockedKeywords = ["گندا", "فحش", "برائی", "گالی", "غلط", "لعنت", "بےغیرت", "فارغ"];

    bool containsBlocked = false;
    for (String word in blockedKeywords) {
      if (text.contains(word)) {
        containsBlocked = true;
        break;
      }
    }

    setState(() {
      _result = containsBlocked ? "خبردار! یہ مواد ممنوعہ ہے." : "یہ مواد ٹھیک ہے.";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("فلٹر ایپ")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(hintText: "یہاں لفظ لکھیں"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkContent,
              child: Text("چیک کریں"),
            ),
            SizedBox(height: 20),
            Text(_result, style: TextStyle(fontSize: 18, color: Colors.red)),
          ],
        ),
      ),
    );
  }
}

