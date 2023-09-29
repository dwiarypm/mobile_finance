import 'package:mobile_finance/controller/sql_helper.dart';
import 'package:mobile_finance/models/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobile_finance/provider/user_provider.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  String developerName = "Dwiary Putri Megayanti";
  String developerNim = "2141764115";

  final DbHelper dbHelper = DbHelper();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;
    return Scaffold(
      appBar: AppBar(
        title: Text("Pengaturan"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Ubah Password",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: currentPasswordController,
              obscureText: true,
              decoration: InputDecoration(labelText: "Password Saat Ini"),
            ),
            TextField(
              controller: newPasswordController,
              obscureText: true,
              decoration: InputDecoration(labelText: "Password Baru"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _changePassword(user!);
              },
              child: Text("Simpan Password Baru"),
            ),
            SizedBox(height: 40),
            Text(
              "Developer",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/profilfoto.jpg"),
              radius: 50,
            ),
            SizedBox(height: 10),
            Text(developerName),
            Text(developerNim),
          ],
        ),
      ),
    );
  }

  void _changePassword(User user) {
    String currentPasswordInput = currentPasswordController.text;
    String newPasswordInput = newPasswordController.text;

    if (currentPasswordInput == user.password) {
      // Password saat ini benar, simpan password baru
      dbHelper.changePassword(user.username!, newPasswordInput);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Password berhasil diubah."),
      ));
    } else {
      // Password saat ini salah
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Password saat ini salah. Ubah password gagal."),
      ));
    }
  }
}
