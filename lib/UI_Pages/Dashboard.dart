import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              floating: true,
              pinned: true,
              flexibleSpace: const FlexibleSpaceBar(
                title: Text('Vigilante Devices'),
                background: Image(
                  image: AssetImage('Assets/Images/devices.jpg'),
                ),
              ))
        ],
      ),
    );
  }
}
