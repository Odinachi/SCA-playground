import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:secondapp/features/constant.dart';

class UserInputScreen extends StatefulWidget {
  const UserInputScreen({super.key});

  @override
  State<UserInputScreen> createState() => _UserInputScreenState();
}

class _UserInputScreenState extends State<UserInputScreen> {
  final _fullNameController = TextEditingController();
  final _fullNameNode = FocusNode();
  final _emailController = TextEditingController();
  final _emailNode = FocusNode();
  final _passwordController = TextEditingController();
  final _passwordNode = FocusNode();
  final _age = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool viewPassword = true;
  List? errorMsg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User input"),
      ),
      body: Form(
        key: _formKey,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Input your details",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _fullNameController,
                      focusNode: _fullNameNode,
                      keyboardType: TextInputType.text,
                      onFieldSubmitted: (a) {
                        print("User submits $a");
                      },
                      onChanged: (a) {
                        print("User typed $a");
                      },
                      textCapitalization: TextCapitalization.words,
                      // textInputAction: TextInputAction.continueAction,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[a-z A-Z]')),
                      ],
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        filled: true,
                        hintText: "eg Dasuma Ahmed",
                        label: Text("Full name"),
                        fillColor: Colors.blue.withOpacity(.1),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _emailController,
                      focusNode: _emailNode,
                      cursorColor: Colors.grey,
                      keyboardType: TextInputType.emailAddress,
                      validator: (a) {
                        if (emailRegex.hasMatch(a ?? "")) {
                          return null;
                        } else {
                          return "Invalid email";
                        }
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r'[ ]')),
                      ],
                      decoration: InputDecoration(
                        filled: true,
                        hintText: "eg email@amil.com",
                        label: Text("Email Address"),
                        fillColor: Colors.blue.withOpacity(.1),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      focusNode: _passwordNode,
                      cursorColor: Colors.grey,
                      obscuringCharacter: "☢",
                      obscureText: viewPassword,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (a) {
                        List err = [];
                        final smallLet = RegExp(r"[a-z]");
                        final capLet = RegExp(r"[A-Z]");
                        final numbers = RegExp(r"[0-9]");
                        final special = RegExp(r"[@#$]");
                        if (!smallLet.hasMatch(a ?? "")) {
                          err.add("Password must contain Lowercase");
                        }
                        if (!capLet.hasMatch(a ?? "")) {
                          err.add("Password must contain Uppercase");
                        }
                        if (!numbers.hasMatch(a ?? "")) {
                          err.add("Password must contain Numbers");
                        }
                        if (!special.hasMatch(a ?? "")) {
                          err.add("Password must contain Special character");
                        }
                        if ((a ?? "").length < 7) {
                          err.add("Password must be greater 6 characters");
                        }
                        errorMsg = null;
                        if (err.isEmpty) {
                          setState(() {});
                          return null;
                        } else {
                          setState(() {});
                          errorMsg = err;
                          return '';
                        }
                      },
                      enableSuggestions: false,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              viewPassword = !viewPassword;
                              setState(() {});
                            },
                            icon: Icon(viewPassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined)),
                        filled: true,
                        hintText: "eg MyName...",
                        label: Text("Password"),
                        fillColor: Colors.blue.withOpacity(.1),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                    if (errorMsg != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List<Widget>.from(
                          (errorMsg ?? []).map(
                            (e) => Text(
                              e,
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10),
                            ),
                          ),
                        ),
                      ),
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30.0),
                      child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {}
                          },
                          child: Text("Save")),
                    ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// TextFormField(
//   textCapitalization: TextCapitalization.words,
//   keyboardType: TextInputType.text,
//   textInputAction: TextInputAction.newline,
//   style: TextStyle(
//       color: Colors.red,
//       fontWeight: FontWeight.w600,
//       fontSize: 20),
//
//   inputFormatters: [
//     // FilteringTextInputFormatter.digitsOnly,
//     FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
//   ],
//   decoration: InputDecoration(
//     hintText: "eg. Abisola",
//     hintStyle: TextStyle(
//         color: Colors.grey,
//         fontWeight: FontWeight.w400,
//         fontSize: 12),
//     label: Text(
//       "Name",
//       style: TextStyle(
//         color: Colors.grey,
//         fontWeight: FontWeight.w500,
//         fontSize: 17,
//       ),
//     ),
//     prefixIcon: Icon(Icons.add),
//     prefix: Icon(Icons.remove),
//     suffix: Icon(Icons.ac_unit_outlined),
//     suffixIcon: Icon(Icons.access_alarms_sharp),
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(12),
//       borderSide: BorderSide(
//         width: 2,
//         color: Colors.orange,
//       ),
//     ),
//     enabledBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(12),
//       borderSide: BorderSide(
//         width: 2,
//         color: Colors.green,
//       ),
//     ),
//     focusedBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(12),
//       borderSide: BorderSide(
//         width: 2,
//         color: Colors.blueGrey,
//       ),
//     ),
//     disabledBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(12),
//       borderSide: BorderSide(
//         width: 2,
//         color: Colors.red,
//       ),
//     ),
//     errorBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(12),
//       borderSide: BorderSide(
//         width: 2,
//         color: Colors.red.shade900,
//       ),
//     ),
//     focusedErrorBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(12),
//       borderSide: BorderSide(
//         width: 2,
//         color: Colors.yellowAccent,
//       ),
//     ),
//   ),
//
//   // obscureText: true,
//   // obscuringCharacter: "*",
//   // enabled: false,
//
//   // cursorColor: Colors.pink,
//   // cursorHeight: 200,
//   // cursorWidth: 10,
//   // cursorRadius: Radius.circular(50),
// ),
