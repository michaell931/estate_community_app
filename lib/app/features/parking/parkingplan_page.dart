import 'package:flutter/material.dart';

class ParkingPlan extends StatelessWidget {
  const ParkingPlan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(5),
      child: const Center(
        child: Image(image: AssetImage('images/parkingplan.jpg')),
      ),
    );
  }
}
