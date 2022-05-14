import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:us_market/sources/utility/utility.dart';

import '../../../../../sources/const.dart';
import '../../../../provider/state_fragment.dart';
import '../../../login/login.dart';

class DrawBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 250,
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView.builder(
            itemCount: stateList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  if (stateList[index].getState() == StatePage.out) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  }
                  Provider.of<StateFragment>(context, listen: false)
                      .setState(stateList[index].getState());
                  Scaffold.of(context).openEndDrawer();
                },
                child: Consumer<StateFragment>(
                  builder: (yourContext, model, _) {
                    StatePage state = model.getState();
                    return Container(
                      padding: const EdgeInsets.only(
                          left: 10, top: 5, right: 8, bottom: 5),
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [boxShadow()],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            stateList[index].getPath(),
                            width: 23,
                            height: 23,
                            color: state == stateList[index].getState()
                                ? colorTheme1
                                : Colors.black,
                          ),
                          const SizedBox(width: 29),
                          Text(stateList[index].getName(),
                              style: textStyle(
                                  state == stateList[index].getState()
                                      ? colorTheme1
                                      : Colors.black,
                                  18,
                                  FontWeight.w500))
                        ],
                      ),
                    );
                  },
                ),
              );
            }));
  }
}
