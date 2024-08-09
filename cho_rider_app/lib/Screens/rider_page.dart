import 'package:cho_rider_app/Screens/earnings_page.dart';
import 'package:cho_rider_app/Screens/finished_order_page.dart';
import 'package:cho_rider_app/Screens/new_order_page.dart';
import 'package:cho_rider_app/Screens/profile_page.dart';
import 'package:cho_rider_app/models/rider.dart';
import 'package:flutter/material.dart';

class RiderPage extends StatelessWidget {
  final Rider rider;
  const RiderPage({super.key, required this.rider});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow.shade600,
          title: Text('Hello ${rider.name}'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                minRadius: 81,
                child: Icon(
                  Icons.person,
                  size: 72,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.6,
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisExtent: 240),
                children: [
                  RiderWidget(
                    ontap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ProfilePage(),
                        ),
                      );
                    },
                  ),
                  RiderWidget(
                    icon: Icons.shopping_cart_outlined,
                    name: 'New Orders',
                    ontap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const NewOrderPage(),
                        ),
                      );
                    },
                  ),
                  RiderWidget(
                    icon: Icons.shopping_cart_checkout_rounded,
                    name: "Finished Orders",
                    ontap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const FinishedOrderPage(),
                        ),
                      );
                    },
                  ),
                  RiderWidget(
                    icon: Icons.attach_money,
                    name: 'Summary',
                    ontap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const EarningsPage(),
                        ),
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RiderWidget extends StatelessWidget {
  const RiderWidget({
    super.key,
    this.icon = Icons.person,
    this.name = " Profile",
    required this.ontap,
  });

  final IconData icon;
  final String name;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: ontap,
                child: Container(
                  height: 160,
                  width: 220,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black),
                      color: Colors.yellow.shade600,
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: Icon(
                      icon,
                      size: 48,
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  name,
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
