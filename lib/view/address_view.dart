import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sistema_entrega/provider/provider.dart';
import 'package:sistema_entrega/widget/widget.dart';

class AddressView extends StatelessWidget {
  const AddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    return ListView.separated(
      itemCount: homeProvider.listAddress.length,
      itemBuilder: (BuildContext context, int index) {
        return CustomCard(
          onTap: () {
            showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (_) => ModalBottomSheet(
                    width: double.infinity,
                    content: Column(
                      children: [
                        RowInfo(
                            title: 'SS',
                            data:
                                homeProvider.listAddress[index].sS.toString()),
                        RowInfo(
                            title: 'Conductor',
                            data: homeProvider.retrunNameDriver(homeProvider
                                .listAddress[index].assignedDriver)),
                      ],
                    ),
                    title: 'Informacion de envio'));
          },
          widget: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RowInfo(
                  title: 'Street',
                  data: homeProvider.listAddress[index].street),
              RowInfo(
                  title: 'City', data: homeProvider.listAddress[index].city),
              RowInfo(
                  title: 'Province',
                  data: homeProvider.listAddress[index].stateProvinceArea),
              RowInfo(
                  title: 'Phone numbe',
                  data: homeProvider.listAddress[index].phoneNumber),
              RowInfo(
                  title: 'Zip code',
                  data: homeProvider.listAddress[index].zipCode.toString()),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: 5,
      ),
    );
  }
}
