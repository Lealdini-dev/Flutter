import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_bank_oficial/database/dao/contact_dao.dart';
import 'package:neo_bank_oficial/screens/contacts_list.dart';
import 'package:neo_bank_oficial/screens/name.dart';
import 'package:neo_bank_oficial/screens/transaction_list.dart';

class DashboardContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NameCubit('Guilherme'),
      child: DashboardView(),
    );
  }
}

class DashboardView extends StatelessWidget {
  final ContactDao contactDao;

  DashboardView({@required this.contactDao});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('images/neobank.png')),
                Container(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      FeatureItem(
                        'Transfer',
                        Icons.monetization_on_outlined,
                        onClick: () {
                          _showContactList(context);
                        },
                      ),
                      FeatureItem(
                        'Transaction Feed',
                        Icons.description_outlined,
                        onClick: () {
                          _showTransactionsList(context);
                        },
                      ),
                      FeatureItem(
                        'Transaction Feed',
                        Icons.person_outline,
                        onClick: () {
                          _showChangeName(context);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showContactList(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ContactsList(contactDao: contactDao)));
  }

  void _showChangeName(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => NameContainer()));
  }

  void _showTransactionsList(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TransactionsList(),
      ),
    );
  }
}

class FeatureItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function onClick;

  FeatureItem(this.name, this.icon, {@required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.blueAccent[700],
        child: InkWell(
          onTap: () => onClick(),
          child: Container(
            padding: EdgeInsets.all(8.0),
            width: 120,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    icon,
                    color: Colors.white,
                    size: 24.0,
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
