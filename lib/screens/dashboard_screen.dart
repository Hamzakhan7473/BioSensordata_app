import 'package:flutter/material.dart';
import 'analysis_screen.dart';
import 'history_screen.dart';
import 'login_screen.dart';
import '../services/api_service.dart';

class DashboardScreen extends StatelessWidget {
  final String username;
  DashboardScreen({required this.username});

  void logout(BuildContext context) async {
    await ApiService.logout(username);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [IconButton(onPressed: () => logout(context), icon: Icon(Icons.logout))],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AnalysisScreen(username: username))), child: Text('Analyze Live Sensor')),
            ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => HistoryScreen(username: username))), child: Text('View History')),
          ],
        ),
      ),
    );
  }
}