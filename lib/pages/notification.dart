import 'package:flutter/material.dart';
import 'package:kuza/pages/home_page.dart';

class Notification {
  final String title;
  final String message;
  final String time;
  final String avatarUrl;
  bool isRead;

  Notification({
    required this.title,
    required this.message,
    required this.time,
    required this.avatarUrl,
    this.isRead = false,
  });
}

class NotificationsPage extends StatefulWidget {
  NotificationsPage({Key? key}) : super(key: key);

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  List<Notification> notifications = [
    Notification(
      title: 'Sale Completed',
      message: 'You have completed a sale of \$250.',
      time: '2m ago',
      avatarUrl: 'https://example.com/avatar1.png',
    ),
    Notification(
      title: 'New Product Added',
      message: 'New product "Widget A" added to the inventory.',
      time: '10m ago',
      avatarUrl: 'https://example.com/avatar2.png',
      isRead: true,
    ),
    Notification(
      title: 'Low Stock Alert',
      message: 'Product "Gadget B" is low on stock.',
      time: '1h ago',
      avatarUrl: 'https://example.com/avatar3.png',
    ),
    Notification(
      title: 'Product Expiry',
      message: 'Product "Item C" is nearing expiry.',
      time: '3h ago',
      avatarUrl: 'https://example.com/avatar4.png',
      isRead: true,
    ),
    Notification(
      title: 'Sale Completed',
      message: 'You have completed a sale of \$450.',
      time: '1d ago',
      avatarUrl: 'https://example.com/avatar5.png',
    ),
  ];

  bool _showUnread = false;
  bool _showRead = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Notifications',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 167, 222, 248),
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => HomePage(), // Navigate to the HomePage
              ));
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ), // Use the back arrow icon
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _showUnread = true;
                        _showRead = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _showUnread
                          ? const Color.fromARGB(255, 167, 222, 248)
                          : Color.fromARGB(255, 243, 242, 242),
                      textStyle: TextStyle(
                        color: _showUnread ? Colors.white : Colors.black,
                      ),
                    ),
                    child: Text('Unread'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _showUnread = false;
                        _showRead = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _showRead
                          ? const Color.fromARGB(255, 167, 222, 248)
                          : Color.fromARGB(255, 243, 242, 242),
                      textStyle: TextStyle(
                        color: _showRead ? Colors.white : Colors.black,
                      ),
                    ),
                    child: Text('Read'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final notification = notifications[index];
                  if (_showUnread && notification.isRead) {
                    return SizedBox.shrink();
                  }
                  if (_showRead && !notification.isRead) {
                    return SizedBox.shrink();
                  }
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(notification.avatarUrl),
                    ),
                    title: Text(
                      notification.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: notification.isRead ? Colors.grey : Colors.black,
                      ),
                    ),
                    subtitle: Text(notification.message),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Delete Notification?'),
                                  content: Text(
                                      'Are you sure you want to delete this notification?'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          notifications.removeAt(index);
                                        });
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Delete'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    tileColor:
                        notification.isRead ? Colors.grey[200] : Colors.white,
                    onTap: () {
                      // Handle notification tap
                    },
                  );
                },
              ),
            ),
          ],
        ),
      );
}
