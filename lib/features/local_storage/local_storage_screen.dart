import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:word_generator/word_generator.dart';

class LocalStorageScreen extends StatefulWidget {
  const LocalStorageScreen({super.key});

  @override
  State<LocalStorageScreen> createState() => _LocalStorageScreenState();
}

class _LocalStorageScreenState extends State<LocalStorageScreen> {
  List<String>? notifications;

  final lsc = LocalStorageClass();

  @override
  void initState() {
    super.initState();
    notifications = lsc.getNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () async {
          await lsc.addNotification(WordGenerator().randomSentence(10));
          notifications = lsc.getNotifications();
          setState(() {});
        },
        child: const Text("Add Notification"),
      ),
      appBar: AppBar(
        title: const Text("Local Storage"),
      ),
      body: (notifications?.isNotEmpty ?? false)
          ? ListView.separated(
              separatorBuilder: (_, __) => const Divider(),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              itemBuilder: (_, index) {
                final each = notifications?[index];
                return Text(each ?? "");
              },
              itemCount: notifications?.length ?? 0,
            )
          : const Center(child: Text("No Notifications yet")),
    );
  }
}

class LocalStorageClass {
  static final LocalStorageClass _singleton = LocalStorageClass._internal();

  factory LocalStorageClass() {
    return _singleton;
  }

  LocalStorageClass._internal();

  late final SharedPreferences _sp;

  final _notificationKey = "noti_key";

  void initialize() async {
    _sp = await SharedPreferences.getInstance();
  }

  Future<void> addNotification(String noti) async {
    await _sp.setStringList(_notificationKey, [...?getNotifications(), noti]);
  }

  List<String>? getNotifications() {
    return _sp.getStringList(_notificationKey);
  }
}
