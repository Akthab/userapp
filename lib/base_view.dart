import 'package:flutter/material.dart';

import 'app_enums.dart';

abstract class BaseView extends StatefulWidget {
  const BaseView({Key? key}) : super(key: key);
}

abstract class BaseViewState<T extends BaseView> extends State<T> {
  Widget buildView(BuildContext context, Size size);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: buildView(context, size));
  }

  void showCustomToast(
      BuildContext context, String? message, SnackBarType snackBarType) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Row(
          children: [
            if (snackBarType == SnackBarType.error)
              const Icon(
                Icons.error,
                color: Colors.white,
              )
            else
              const Icon(
                Icons.check_circle_rounded,
                color: Colors.white,
              ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Text(
                message ?? "",
                overflow: TextOverflow.visible,
                // style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
          ],
        ),
        backgroundColor:
            snackBarType == SnackBarType.error ? Colors.red : Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Close',
          onPressed: scaffold.hideCurrentSnackBar,
          textColor: Colors.white,
        ),
      ),
    );
  }

  // Method to show Dialog
  // void showVoterDialog(BuildContext context, Map<String, dynamic> data) {
  //   // final String title =
  //   //     data["voteTitle"] != null ? data["voteTitle"] as String : "-";
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return VoterAlert();
  //       });
  // }
}
