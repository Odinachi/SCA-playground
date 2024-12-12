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

  double? value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Return pop value"),
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
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  // showModalBottomSheet(
                  //     backgroundColor: Colors.blue.withOpacity(.2),
                  //     isScrollControlled: true,
                  //     context: context,
                  //     builder: (_) => Column(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             CupertinoActionSheet(
                  //               message: Text("Your was login successful"),
                  //               title: Text("Login successful"),
                  //               actions: [
                  //                 CupertinoActionSheetAction(
                  //                     onPressed: () {},
                  //                     child: Text("Thank you")),
                  //                 CupertinoActionSheetAction(
                  //                     onPressed: () {
                  //                       Navigator.pop(context);
                  //                     },
                  //                     child: Text("Let me in")),
                  //               ],
                  //             ),
                  //           ],
                  //         ));

                  // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  //   elevation: 0,
                  //   content: Text(
                  //     "Hello",
                  //     style: TextStyle(
                  //       fontWeight: FontWeight.w600,
                  //     ),
                  //   ),
                  //   behavior: SnackBarBehavior.floating,
                  //   action: SnackBarAction(
                  //       label: "Close",
                  //       onPressed: () {
                  //         ScaffoldMessenger.of(context).clearSnackBars();
                  //       }),
                  //   backgroundColor: Colors.red,
                  // ));

                  //
                  // showDialog(
                  //   context: context,
                  //   builder: (_) => CupertinoActionSheet(
                  //     message: Text("Your was login successful"),
                  //     title: Text("Login successful"),
                  //     actions: [
                  //       CupertinoActionSheetAction(
                  //           onPressed: () {}, child: Text("Thank you")),
                  //       CupertinoActionSheetAction(
                  //           onPressed: () {
                  //             Navigator.pop(context);
                  //           },
                  //           child: Text("Let me in")),
                  //     ],
                  //   ),
                  // );
                  //
                  //
                  // showDialog(
                  //     barrierDismissible: false,
                  //     context: context,
                  //     builder: (_) => AlertDialog(
                  //           backgroundColor: Colors.green.shade200,
                  //           content: Text(
                  //             "Login successful",
                  //             style: TextStyle(
                  //                 fontSize: 30, fontWeight: FontWeight.w600),
                  //           ),
                  //           actions: [
                  //             ElevatedButton(
                  //                 onPressed: () {}, child: Text("Thank you")),
                  //             ElevatedButton(
                  //                 onPressed: () {
                  //                   Navigator.pop(context);
                  //                 },
                  //                 child: Text("Let me in")),
                  //           ],
                  //         ));

                  // Navigator.pop(context, _controller.text);
                },
                child: Text("Return value"))
          ],
        ),
      ),
    );
  }
}
