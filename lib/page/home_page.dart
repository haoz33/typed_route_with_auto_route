import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:typed_route_with_auto_route/router/app_router.gr.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushRoute(SettingRoute());
        },
      ),
    );
  }
}
