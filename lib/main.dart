import 'package:flutter/material.dart';
import 'package:persnalexpenses_app/screens/signup_screen.dart';
import 'package:persnalexpenses_app/screens/splash_screen.dart';

import 'package:persnalexpenses_app/screens/welcome_scrren.dart';
import 'package:persnalexpenses_app/utils/routes.dart';
import 'package:persnalexpenses_app/widgets/chart.dart';
import 'package:persnalexpenses_app/widgets/new_transaction.dart';
import './widgets/transaction_list.dart';

import 'models/transaction.dart';
import 'screens/login_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        errorColor: Colors.red,
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
              fontFamily: "Quicksand",
              fontSize: 20.0,
              fontWeight: FontWeight.bold),
        ),
        fontFamily: "Quicksand",
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.pink),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScrren(),
      initialRoute: 'login',
      routes: {
        MyRoutes.login: (context) => const LoginPage(),
        MyRoutes.home: (context) => const HomePage(),
        MyRoutes.signup: (context) => const SignupScrren(),
        MyRoutes.welcomescreen: (context) => const WelcomeScreen()
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // String titleInput = "";
  // final titleController = TextEditingController();

  // final amountController = TextEditingController();
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: '1',
    //   amount: 69.66,
    //   title: 'Shoes',
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: '2',
    //   amount: 45.34,
    //   title: 'Grocery',
    //   date: DateTime.now(),
    // ),
  ];
  List<Transaction> get _recentTransactionlist {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(
      String txtitle, double txamount, DateTime chosenDate) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txtitle,
      amount: txamount,
      date: chosenDate,
    );
    // setstate call
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: NewTransaction(_addNewTransaction),
          );
        });
    // showModelBottomSheet(
    //   context: ctx,
    //   builder: (_) {
    //     return NewTransaction(_addNewTransaction);
    //   },
    // );
  }

  void _deleteTransactionlist(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Expenses App",
            style: TextStyle(fontFamily: "Poppins"),
          ),
          actions: [
            IconButton(
              onPressed: () => _startAddNewTransaction(context),
              icon: const Icon(Icons.add),
            ),
          ],
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Chart(_recentTransactionlist),
              TransactionList(_userTransactions, _deleteTransactionlist)
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          // elevation: 12,
          // splashColor: Colors.pinkAccent,
          // mouseCursor: MaterialStateMouseCursor.textable,
          // tooltip: 'Add',
          //  hoverColor: Colors.orange,
          onPressed: () => _startAddNewTransaction(context),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
