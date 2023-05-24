import 'package:flutter/material.dart';
import 'package:netflix/presentation/widgets/app_bar_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
          child: AppBarWidget(title: 'New & Hot'),
          preferredSize: Size.fromHeight(50)),
      body: Text('screen new and hot'),
    );
  }
}
