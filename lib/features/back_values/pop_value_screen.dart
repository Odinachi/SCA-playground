import 'package:flutter/material.dart';

class PopValueScreen extends StatefulWidget {
  const PopValueScreen({super.key});

  @override
  State<PopValueScreen> createState() => _PopValueScreenState();
}

class _PopValueScreenState extends State<PopValueScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Return pop value"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              onTapOutside: (a) {
                FocusScope.of(context).unfocus();
              },
              controller: _controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, _controller.text);
                },
                child: Text("Return value"))
          ],
        ),
      ),
    );
  }
}
