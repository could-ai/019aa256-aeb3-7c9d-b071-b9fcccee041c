import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for users
    final List<Map<String, String>> users = [
      {
        'name': 'Sarah Jenkins',
        'location': 'New York, USA',
        'role': 'Photographer',
        'image': 'https://i.pravatar.cc/150?u=1',
      },
      {
        'name': 'David Chen',
        'location': 'Toronto, Canada',
        'role': 'Software Engineer',
        'image': 'https://i.pravatar.cc/150?u=2',
      },
      {
        'name': 'Amara Osei',
        'location': 'London, UK',
        'role': 'Designer',
        'image': 'https://i.pravatar.cc/150?u=3',
      },
      {
        'name': 'Marcus Johnson',
        'location': 'Berlin, Germany',
        'role': 'Musician',
        'image': 'https://i.pravatar.cc/150?u=4',
      },
      {
        'name': 'Elena Rodriguez',
        'location': 'Madrid, Spain',
        'role': 'Architect',
        'image': 'https://i.pravatar.cc/150?u=5',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Connect'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey.shade200,
                    backgroundImage: NetworkImage(user['image']!),
                    onBackgroundImageError: (_, __) {
                      // Fallback if network image fails
                    },
                    child: const Icon(Icons.person, color: Colors.grey),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user['name']!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          user['role']!,
                          style: TextStyle(
                            color: Colors.blue.shade700,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          user['location']!,
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Connection request sent to ${user['name']}'),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    },
                    icon: const Icon(Icons.person_add_alt_1, color: Colors.blue),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.blue.shade50,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
