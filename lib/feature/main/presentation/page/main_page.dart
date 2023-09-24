import 'package:cs_hd_hour/core/local_data/local_source.dart';
import 'package:cs_hd_hour/feature/info/presentation/page/widget/timer_widget.dart';
import 'package:cs_hd_hour/feature/main/presentation/page/widgets/actions.dart';
import 'package:cs_hd_hour/injection_container.dart';
import 'package:cs_hd_hour/router/routes_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  String clientName = sl<LocalSource>().getClientName();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          clientName,
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.purple,
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                RoutesName.clientInfo,
              );
            },
            icon: const Icon(Icons.info_outline)),
        actions: [
          IconButton(
            iconSize: 30,
            onPressed: () {
              FirebaseAuth.instance.signOut();
              sl<LocalSource>().removeStart();
              sl<LocalSource>().deleteData();
              sl<LocalSource>().deleteDateTime();
              Navigator.pushNamedAndRemoveUntil(
                  context, RoutesName.login, (route) => false);
            },
            icon: const Icon(Icons.exit_to_app_sharp),
          ),
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Время работы', style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 25
            ),),
            SizedBox(height: 15,),
            TimerWidget()
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Начать работу',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Colors.purple.shade500),
          ),
          const ActionsButton(),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
