import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Datta Enterprises',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                      Text(
                        'F-22, M.I.D.C., Shiroli,Kolhapur-416122\nMH-INDIA',
                        style: TextStyle(
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ),
                Builder(
                  builder: (context) {
                    return IconButton(
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.orange,
                        size: 30,
                      ),
                    );
                  },
                ),
              ],
            ),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                menuButtons(
                  'Account',
                  Icons.account_balance,
                  100,
                  100,
                  15,
                  () {},
                ),
                menuButtons(
                  'Comman',
                  Icons.menu_book,
                  100,
                  100,
                  15,
                  () {},
                ),
                menuButtons(
                  'HRM',
                  Icons.groups_outlined,
                  100,
                  100,
                  15,
                  () {},
                ),
                menuButtons(
                  'Payments',
                  Icons.payment,
                  100,
                  100,
                  15,
                  () {},
                ),
                menuButtons(
                  'Audit',
                  Icons.menu_book,
                  100,
                  100,
                  15,
                  () {},
                ),
                menuButtons(
                  'Export',
                  Icons.list,
                  100,
                  100,
                  15,
                  () {},
                ),
                menuButtons(
                  'Config',
                  Icons.data_array,
                  100,
                  100,
                  15,
                  () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget menuButtons(String label, IconData icon, double width, double height,
      double fontSize, Function() onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize: Size(width, height),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.white),
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40,
            color: Colors.orange,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            label,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.orange,
                fontSize: fontSize),
          ),
        ],
      ),
    );
  }
}
