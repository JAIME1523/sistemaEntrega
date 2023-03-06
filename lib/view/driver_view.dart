import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sistema_entrega/models/models.dart';
import 'package:sistema_entrega/provider/provider.dart';
import 'package:sistema_entrega/widget/widget.dart';

class DriverView extends StatelessWidget {
  const DriverView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    return Container(
        child: ListView.separated(
      itemCount: homeProvider.listDrivers.length,
      itemBuilder: (BuildContext context, int index) {
        return CustomCard(
          height: 100,
          onTap: () {
            ShippingAddressModel addres =
                homeProvider.retrunStrate(homeProvider.listDrivers[index].assignedTrip);

            showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (_) => ModalBottomSheet(
                  height: 240,
                    width: double.infinity,
                    content: Column(
                      children: [
                        RowInfo(title: 'SS', data: addres.sS.toString()),
                        RowInfo(title: 'Street', data: addres.street),
                        RowInfo(title: 'City', data: addres.city),
                        RowInfo(
                            title: 'Province', data: addres.stateProvinceArea),
                        RowInfo(title: 'Phone numbe', data: addres.phoneNumber),
                        RowInfo(
                            title: 'Zip code', data: addres.zipCode.toString()),
                      ],
                    ),
                    title: 'Informacion de envio'));
          },
          widget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RowInfo(
                  title: 'Conductor',
                  data: homeProvider.listDrivers[index].name),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: 5,
      ),
    ));
  }
}
