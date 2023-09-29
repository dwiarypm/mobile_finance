import 'package:mobile_finance/konstan/route_constant.dart';
import 'package:mobile_finance/view/pengeluaran.dart';
import 'package:mobile_finance/view/income.dart';
import 'package:mobile_finance/view/caku.dart';
import 'package:mobile_finance/view/home.dart';
import 'package:mobile_finance/login.dart';
import 'package:mobile_finance/view/setting.dart';
import 'package:mobile_finance/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => UserProvider()),
  ], child: const MyApp()));
}

final routes = {
  loginRoute: (BuildContext context) => LoginPage(),
  homeRoute: (BuildContext context) => Home(),
  settingsRoute: (BuildContext context) => SettingsPage(),
  addExpenseRoute: (BuildContext context) => AddExpenditurePage(),
  addIncomeRoute: (BuildContext context) => AddIncomePage(),
  detailCashFlowRoute: (BuildContext context) => DetailCashFlowPage(),
};

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Cashflow App",
      routes: routes,
    );
  }
}
