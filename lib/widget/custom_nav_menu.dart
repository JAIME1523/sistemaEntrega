import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sistema_entrega/provider/provider.dart';

class CustomNavButto {
  final VoidCallback onPressed;
  final IconData icon;
  final String tilte;

  CustomNavButto(
      {required this.tilte, required this.onPressed, required this.icon});
}

class CustomNavMenu extends StatelessWidget {
  const CustomNavMenu({
    Key? key,
    this.mostar = true,
    this.backgroundColor = Colors.white,
    this.activeColor = Colors.black,
    this.inactiveColor = Colors.blueGrey,
    required this.items,
  }) : super(key: key);
  final Color backgroundColor;
  final Color activeColor; //black
  final Color inactiveColor; //blue
  final bool mostar;
  final List items;


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MenuModel(),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 250),
        opacity: (mostar) ? 1 : 0,
        child: Builder(
          builder: (BuildContext context) {
            Provider.of<MenuModel>(context).backgroundColor = backgroundColor;
            Provider.of<MenuModel>(context).activeColor = activeColor;
            Provider.of<MenuModel>(context).inactiveColor = inactiveColor;

            return _PrinteredMenuBackground(
              child: _MenuItems(menuItems: items),
            );
          },
        ),
      ),
    );
  }
}

class _PrinteredMenuBackground extends StatelessWidget {
  const _PrinteredMenuBackground({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Provider.of<MenuModel>(context).backgroundColor;
    return Container(
      width: 300,
      height: 60,
      decoration: BoxDecoration(
          color: backgroundColor,
          border: const Border(
              top: BorderSide(color: Colors.black))
          ),
      child: child,
    );
  }
}

class _MenuItems extends StatelessWidget {
  const _MenuItems({Key? key, required this.menuItems}) : super(key: key);

  final List menuItems;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
            menuItems.length,
            (index) => _CustomNavMenuButtom(
                  index: index,
                  item: menuItems[index],
                )));
  }
}

class _CustomNavMenuButtom extends StatelessWidget {
  const _CustomNavMenuButtom(
      {Key? key, required this.index, required this.item})
      : super(key: key);
  final int index;
  final CustomNavButto item;
  @override
  Widget build(BuildContext context) {
    final itemSeleccionado = Provider.of<MenuModel>(context).itemSeleccionado;

    return GestureDetector(
      onTap: () {
        Provider.of<MenuModel>(context, listen: false).itemSeleccionado =
            index;

        itemSeleccionado == index ? null : item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding:const EdgeInsets.symmetric(horizontal: 4),
        width: itemSeleccionado == index ? 150 : 30,
        height: 40,
        // color: Colors.red,
        decoration: itemSeleccionado == index
            ? const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color(0xFF17181c),
              )
            : null,

        child: Row(
          children: [
            const Spacer(),
            Icon(item.icon,
                size: (itemSeleccionado == index) ? 18 : 14,
                color: (itemSeleccionado == index)
                    ? Provider.of<MenuModel>(context).activeColor
                    : Provider.of<MenuModel>(context).inactiveColor),
            const Spacer(),
            itemSeleccionado == index
                ? Text(
                    item.tilte,
                    style: TextStyle(
                        fontSize: 13,
                        color: Provider.of<MenuModel>(context).activeColor),
                  )
                : Container(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}


