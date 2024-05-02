import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'detail.dart';
import 'home.dart';
import 'provider.dart';
import 'signup.dart';

class ManageAcc extends StatefulWidget {
  const ManageAcc({super.key});

  @override
  State<ManageAcc> createState() => _ManageAccState();
}

class _ManageAccState extends State<ManageAcc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account Center"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer<AccountProvider>(
                builder: (context, accountProvider, _) {
                  List<Account> accounts = accountProvider.accounts;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Pilih Akun:',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 20),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: accounts.length,
                        itemBuilder: (context, index) {
                          Account account = accounts[index];
                          return ListTile(
                            title: Text(account.namauser),
                            onTap: () {
                              // Panggil method switchAccount dari AccountProvider
                              accountProvider.switchAccount(account);
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => Home()),
                                  (route) => false);
                            },
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => Signup()),
                        (route) => false);
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("Log Out"), Icon(Icons.door_front_door)],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}