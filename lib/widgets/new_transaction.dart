import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addtx;
  const NewTransaction(this.addtx, {super.key});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();
  DateTime? _selectDate;

  void submitData() {
    if (amountController.text.isEmpty) {
      return;
    }
    final enteredtitle = titleController.text;
    final enteredamount = double.parse(amountController.text);
    if (enteredtitle.isEmpty || enteredamount <= 0 || _selectDate == null) {
      return;
    }
    widget.addtx(
        // titleController.text,
        // double.parse(amountController.text),
        enteredtitle,
        enteredamount,
        _selectDate);

    Navigator.of(context).pop();
  }

// DATE PICKER CODE
  void _persentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectDate = pickedDate;
      });
    });
    print('...');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7.0,
      child: Container(
        height: MediaQuery.of(context).size.height / 0.1,
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                controller: titleController,
                onSubmitted: (_) => submitData(),
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(),
                controller: amountController,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 70.0,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _selectDate == null
                            ? "No chosen Date"
                            : 'Picked Date : ${DateFormat.yMd().format(_selectDate!).toString()}',
                        style: const TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.pink),
                      ),
                      onPressed: () => _persentDatePicker(),
                      child: const Text(
                        'TextButton',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: submitData,
                // print(titleInput);
                // print(amountInput);

                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                ),
                child: const Text("Add Transaction"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
