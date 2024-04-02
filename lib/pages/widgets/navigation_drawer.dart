import 'package:flutter/material.dart';
import 'package:kuza/pages/faq.dart';
import 'package:kuza/pages/home_page.dart';
import 'package:kuza/pages/language.dart';
import 'package:kuza/pages/log_out.dart';
import 'package:kuza/pages/profile.dart';
import 'package:kuza/pages/settings_page.dart';
import 'package:kuza/pages/support.dart';
import 'package:kuza/pages/themes.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  const NavigationDrawerWidget({super.key});
  @override
  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(const EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ],
              ),
              const Spacer(),
              const CircleAvatar(
                radius: 24,
                backgroundColor: Colors.blue,
                child: Icon(Icons.add_comment_outlined, color: Colors.black),
              )
            ],
          ),
        ),
      );

  Widget buildSearchField() {
    const color = Colors.black;

    return TextField(
      style: const TextStyle(color: color),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintText: 'Search',
        hintStyle: const TextStyle(color: color),
        prefixIcon: const Icon(Icons.search, color: color),
        filled: true,
        fillColor: Colors.white12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    const color = Colors.black;
    const hoverColor = Colors.black87;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: const TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  @override
  Widget build(BuildContext context) {
    const name = 'Mama Oliech';
    const email = 'mamaoliech@gmail.com';
    const urlImage = 'lib/assets/markus-winkler-pOu_UmkOG-0-unsplash.jpg';

    return Drawer(
      child: Material(
        color: Colors.lightBlueAccent,
        child: ListView(
          children: <Widget>[
            buildHeader(
              urlImage: urlImage,
              name: name,
              email: email,
              onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const UserPage(
                  name: 'Mama Oliech',
                  urlImage: urlImage,
                ),
              )),
            ),
            Container(
              padding: padding,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  buildSearchField(),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Home',
                    icon: Icons.home,
                    onClicked: () {
                      Navigator.of(context).pop(); // Close the drawer
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) =>
                            const HomePage(), // Navigate to the HomePage
                      ));
                    },
                  ),
                  buildMenuItem(
                    text: 'Profile',
                    icon: Icons.person_2,
                    onClicked: () {
                      Navigator.of(context).pop(); // Close the drawer
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const UserPage(
                          name:
                              'Mama Oliech', // Provide the required name argument
                          urlImage:
                              urlImage, // Provide the required urlImage argument
                        ),
                      ));
                    },
                  ),
                  const SizedBox(height: 10),
                  buildMenuItem(
                    text: 'Themes',
                    icon: Icons.color_lens_outlined,
                    onClicked: () {
                      Navigator.of(context).pop(); // Close the drawer
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) =>
                            const Themes(), // Navigate to the HomePage
                      ));
                    },
                  ),
                  const SizedBox(height: 10),
                  buildMenuItem(
                    text: 'Language',
                    icon: Icons.language,
                    onClicked: () {
                      Navigator.of(context).pop(); // Close the drawer
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) =>
                            const Language(), // Navigate to the HomePage
                      ));
                    },
                  ),
                  const SizedBox(height: 10),
                  buildMenuItem(
                    text: 'Support',
                    icon: Icons.support_agent_rounded,
                    onClicked: () {
                      Navigator.of(context).pop(); // Close the drawer
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) =>
                            const Support(), // Navigate to the HomePage
                      ));
                    },
                  ),
                  const SizedBox(height: 10),
                  buildMenuItem(
                    text: 'FAQ',
                    icon: Icons.question_answer_outlined,
                    onClicked: () {
                      Navigator.of(context).pop(); // Close the drawer
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const FAQ(), // Navigate to the HomePage
                      ));
                    },
                  ),
                  const SizedBox(height: 10),
                  const Divider(color: Colors.black54),
                  const SizedBox(height: 10),
                  buildMenuItem(
                    text: 'Settings',
                    icon: Icons.settings,
                    onClicked: () {
                      Navigator.of(context).pop(); // Close the drawer
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) =>
                            const SettingsPage(), // Navigate to the HomePage
                      ));
                    },
                  ),
                  const SizedBox(height: 10),
                  buildMenuItem(
                    text: 'Log Out',
                    icon: Icons.logout,
                    onClicked: () {
                      Navigator.of(context).pop(); // Close the drawer
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) =>
                            const LogOutPage(), // Navigate to the HomePage
                      ));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
