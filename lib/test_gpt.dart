import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _completion = '';
  final textCtrl = TextEditingController();

  Future<void> _generateCompletion() async {
    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/engine/davinci-codex/completions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer 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'
      },
      body: json.encode({
        'prompt': textCtrl.text,
        'max_tokens': 50,
        'temperature': 0.5,
      }),
    );

    final responseData = json.decode(response.body);

    setState(() {
      _completion = responseData['choices'][0]['text'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Chat GPT API Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50.0, horizontal: 200),
                child: TextFormField(controller: textCtrl),
              ),
              ElevatedButton(
                onPressed: _generateCompletion,
                child: Text('Generate Completion'),
              ),
              SizedBox(height: 16),
              Text(_completion),
            ],
          ),
        ),
      ),
    );
  }
}
