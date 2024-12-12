Future<void> main() async {
  try {
    asyncFuncB();
  } catch (e) {}
}

int regularFunc() {
  return 2;
}

Future<int> asyncFunc() async {
  print("This is print A");
  Future.delayed(Duration(seconds: 3), () {
    print("This is print B");
  });
  print("this is print C");
  return 2;
}

Future<int> asyncFuncB() async {
  // print("This is print A for await");
  await Future.delayed(Duration(seconds: 3), () {
    // print("This is print B for await");
  });
  // print("this is print C for await");
  return 2;
}
