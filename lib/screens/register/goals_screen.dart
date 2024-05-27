import 'package:adalato_app/utils/app_routes.dart';
import 'package:flutter/material.dart';

class GoalsScreen extends StatefulWidget {
  @override
  _GoalsScreenState createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  final List<String> _goals = [
    'Build strength',
    'Build muscle',
    'Lose fat',
    'Learn techniques'
  ];
  final List<String> _selectedGoals = [];

  void _toggleSelection(String goal) {
    setState(() {
      if (_selectedGoals.contains(goal)) {
        _selectedGoals.remove(goal);
      } else {
        _selectedGoals.add(goal);
      }
    });
  }

  void _next() {
    if (_selectedGoals.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select at least one goal.'),
        ),
      );
    } else {
      Navigator.pushNamed(context, AppRoutes.register);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Goals',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Choose as many as you like',
              style: TextStyle(color: Colors.grey),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _goals.length,
                itemBuilder: (context, index) {
                  final goal = _goals[index];
                  final isSelected = _selectedGoals.contains(goal);
                  return GestureDetector(
                    onTap: () => _toggleSelection(goal),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isSelected ? Colors.orange : Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            goal,
                            style: TextStyle(
                              color: isSelected ? Colors.orange : Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            _getGoalDescription(goal),
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              ),
              onPressed: _next,
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }

  String _getGoalDescription(String goal) {
    switch (goal) {
      case 'Build strength':
        return 'Get stronger and perform exercises with greater ease';
      case 'Build muscle':
        return 'Increase volume and difficulty to ensure muscle growth';
      case 'Lose fat':
        return 'Optimized for high intensity fat burning workouts';
      case 'Learn techniques':
        return 'Master basic to advanced skills';
      default:
        return '';
    }
  }
}
