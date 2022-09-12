import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double speindingamount;
  final double spendingPcTotal;
  const ChartBar(
    this.label,
    this.speindingamount,
    this.spendingPcTotal, {super.key}
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 20,
            child: FittedBox(
                child: Text('\$${speindingamount.toStringAsFixed(2)}'))),
        const SizedBox(
          height: 2,
        ),
        Container(
          width: 10,
          height: 70,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              FractionallySizedBox(
                heightFactor: 0.25,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(label)
      ],
    );
  }
}
