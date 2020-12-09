import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_bank_oficial/database/dao/contact_dao.dart';
import 'package:neo_bank_oficial/screens/dashboard.dart';

void main() {
  runApp(NeoBankApp(
    contactDao: ContactDao(),
  ));
}

class LogObserver extends BlocObserver {
  @override
  void onChange(Cubit cubit, Change change) {
    print('${cubit.runtimeType}> $change');
    super.onChange(cubit, change);
  }
}

class NeoBankApp extends StatelessWidget {
  final ContactDao contactDao;

  NeoBankApp({@required this.contactDao});

  @override
  Widget build(BuildContext context) {
    Bloc.observer = LogObserver();

    return MaterialApp(
      theme: ThemeData.dark(),
      home: DashboardContainer(),
    );
  }
}
