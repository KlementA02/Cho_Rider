import 'package:cho_rider_app/Screens/transactions_page.dart';
import 'package:flutter/material.dart';

class EarningsPage extends StatelessWidget {
  const EarningsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade600,
        title: const Text('Earnings'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Earning',
              style: TextStyle(fontSize: 36),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.6,
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 14,
                    mainAxisExtent: 220,
                    crossAxisCount: 2),
                children: const [
                  EarningWidget(
                    name: 'Order Received',
                    centerText: '17',
                  ),
                  EarningWidget(
                    centerText: "12",
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const TransactionsPage(),
                  ));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow.shade600,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                child: const Text(
                  "View all deliveries history",
                  style: TextStyle(color: Colors.black),
                )),
          )
        ],
      ),
    );
  }
}

class EarningWidget extends StatelessWidget {
  const EarningWidget({
    super.key,
    this.centerText = '9',
    this.name = 'Orders done',
  });

  final String centerText, name;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              onTap: () {},
              child: Container(
                height: 160,
                width: 200,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    color: Colors.yellow.shade600,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                    child: Text(
                  centerText,
                  style: const TextStyle(fontSize: 48),
                )),
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
    );
  }
}
