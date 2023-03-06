import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sistema_entrega/provider/provider.dart';
import 'package:sistema_entrega/view/view.dart';
import 'package:sistema_entrega/widget/widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => HomeProvider(), child: const _HomeBody());
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
        bottomNavigationBar: const _Nav(),
        body: SafeArea(
            child: homeProvider.viewStatus == ViewsStatus.conductores
                ? const DriverView()
                : const AddressView()));
  }
}

class _Nav extends StatelessWidget {
  const _Nav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);

    return CustomNavMenu(
      backgroundColor: ThemeData.dark().primaryColor,
      activeColor: Colors.white,
      items: [
        CustomNavButto(
            tilte: 'Direcciones',
            onPressed: () {
              homeProvider.viewStatus = ViewsStatus.direcciones;
            },
            icon: FontAwesomeIcons.streetView),
        CustomNavButto(
            tilte: 'Conductores',
            onPressed: () {
              homeProvider.viewStatus = ViewsStatus.conductores;
            },
            icon: FontAwesomeIcons.car),
      ],
    );
  }
}
