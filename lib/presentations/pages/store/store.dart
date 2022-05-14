import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:us_market/presentations/provider/state_fragment.dart';
import 'package:us_market/sources/const.dart';
import 'package:us_market/sources/utility/utility.dart';

import '../../provider/state_store.dart';

class StorePage extends StatelessWidget {
  bool isInc = true;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<StateStore>(
        create: (context) =>
            StateStore(StateSort.increase, StateType.bakery, listSlider),
        builder: (context, _) {
          return Container(
            margin: const EdgeInsets.all(paddingSize - 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      onTap: () {
                        StateSort stateSort =
                            isInc ? StateSort.decrease : StateSort.increase;
                        Provider.of<StateStore>(context, listen: false)
                            .setStateSort(stateSort);
                        isInc = !isInc;
                      },
                      child: Image.asset(
                        iconsPath + 'sort.png',
                        height: 24,
                        width: 24,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    textWidget(
                        Provider.of<StateStore>(context, listen: true)
                                    .stateSort ==
                                StateSort.increase
                            ? 'Tăng dần'
                            : 'Giảm dần',
                        Colors.black,
                        15.0,
                        FontWeight.w400),
                    boxType(context, 'bakery.png', StateType.bakery),
                    boxType(context, 'fruit.png', StateType.fruit),
                    boxType(context, 'milk.png', StateType.milk),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Expanded(
                    child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: (128 / 150),
                  shrinkWrap: true,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 8.0,
                  scrollDirection: Axis.vertical,
                  children: Provider.of<StateFragment>(context, listen: false)
                      .getProductStore(
                          Provider.of<StateStore>(context, listen: true)
                              .stateSort,
                          Provider.of<StateStore>(context, listen: false)
                              .stateType)
                      .map((value) =>
                          item(value, context))
                      .toList(),
                ))
              ],
            ),
          );
        });
  }
}
