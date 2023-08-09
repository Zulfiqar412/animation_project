import 'package:animation_project/utils/app_const.dart';
import 'package:animation_project/widgets/text_widgets.dart';
import 'package:expendable_fab/expendable_fab.dart';
import 'package:flutter/material.dart';

import '../utils/appcolors.dart';
import '../utils/my_size.dart';

class ToggleMenu extends StatefulWidget {
  const ToggleMenu({super.key});

  @override
  State<ToggleMenu> createState() => _ToggleMenuState();
}

class _ToggleMenuState extends State<ToggleMenu> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          text: "Toggle Animation",
          fontSize: MySize.size20,
          fontWeight: FontWeight.w600,
          textColor: AppColors.textColor,
        ),
        actions: [
          Image.asset(
            AppConst.settingsIcon,
            height: MySize.size20,
            width: MySize.size20,
          ),
          SizedBox(
            width: MySize.scaleFactorWidth * 20,
          )
        ],
      ),
      body: Container(),
      floatingActionButton: ExpendableFab(
        distance: 112.0,
        children: [
          ActionButton(
            onPressed: () => toast(context, 'balance'),
            icon: const Icon(Icons.account_balance),
          ),
          ActionButton(
            onPressed: () => toast(context, 'balance'),
            icon: const Icon(Icons.phone),
          ),
          ActionButton(
            onPressed: () => toast(context, 'money'),
            icon: const Icon(Icons.money),
          ),
        ],
      ),
    );
  }

  toast(BuildContext context, String action) {
    // _scaffoldkey.currentState
    //     ?.showSnackBar(SnackBar(content: Text("Selected $action")));
  }
}
