import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:persnalexpenses_app/models/transaction.dart';
import 'package:persnalexpenses_app/widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactionlist;
  Chart(this.recentTransactionlist, {super.key});
  List<Map<String, Object>> get groupedTransactionvalues {
    return List.generate(7, (index) {
      final weekdays = DateTime.now().subtract(Duration(days: index));
      var totalsum = 0.0;
      for (var i = 0; i < recentTransactionlist.length; i++) {
        if (recentTransactionlist[i].date.day == weekdays.day &&
            recentTransactionlist[i].date.month == weekdays.month &&
            recentTransactionlist[i].date.year == weekdays.year) {
          totalsum += recentTransactionlist[i].amount;
        }
      }
      // print(DateFormat.E().format(weekdays));
      // print(totalsum);
      return {
        'day': DateFormat.E().format(weekdays).substring(0, 1),
        'amount': totalsum,
      };
    }).reversed.toList();
  }

  double get totalspending {
    return groupedTransactionvalues.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(groupedTransactionvalues);
    return Card(
      elevation: 17.0,
      margin: const EdgeInsets.all(22.0),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionvalues.map((data) {
            return Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: ChartBar(data['day'].toString(), data['amount'] as double,
                  (data['amount'] as double) / totalspending),
            );
          }).toList(),
        ),
      ),
    );
  }
}
