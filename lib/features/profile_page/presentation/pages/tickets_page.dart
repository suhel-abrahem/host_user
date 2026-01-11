import 'package:flutter/material.dart';
import 'package:hosta_user/core/resource/main_page/main_page.dart';

class TicketsPage extends StatefulWidget {
  const TicketsPage({super.key});

  @override
  State<TicketsPage> createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage> {
  @override
  Widget build(BuildContext context) {
    return MainPage(body: ListView(children: const [Text("Tickets Page")]));
  }
}
