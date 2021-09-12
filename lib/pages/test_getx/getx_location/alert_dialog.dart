import 'package:flutter/material.dart';

showErrorDialog(context, String error,
    {bool barrierDismissible = false,
    bool hasCloseButton = true,
    Function() onOkay,
    bool showButton = false}) {
  showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return ErrorAlert(
          errorMessage: error,
          hasCloseButton: hasCloseButton,
          onOkay: onOkay,
          showButton: showButton,
        );
      });
}

class ErrorAlert extends StatelessWidget {
  final String errorMessage;
  final bool hasCloseButton;
  final Function onOkay;
  final bool showButton;

  const ErrorAlert(
      {@required this.errorMessage,
      this.hasCloseButton = true,
      this.onOkay,
      this.showButton});

  @override
  Widget build(BuildContext context) {
    bool longsize = false;
    if (this.errorMessage.length > 100) {
      longsize = true;
    }
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Dialog(
        backgroundColor: Theme.of(context).backgroundColor,
        child: Container(
          height: hasCloseButton
              ? 275
              : longsize
                  ? 300
                  : 225,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                alignment: Alignment.topRight,
                child: SizedBox(
                  width: 50,
                  child: hasCloseButton
                      ? FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100)),
                          onPressed: () => Navigator.pop(context),
                          // child: SvgPicture.asset(
                          //   Assets.cancel,
                          //   color: Theme.of(context).indicatorColor,
                          //   width: 15,
                          //   height: 15,
                          // ),
                        )
                      : Container(),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 25),
                alignment: Alignment.center,
                // child: SvgPicture.asset(
                //   Assets.alert,
                //   height: 48,
                //   width: 48,
                //   color: Theme.of(context).primaryColor,
                // ),
              ),
              Container(
                padding: EdgeInsets.only(top: 35, left: 15, right: 15),
                alignment: Alignment.center,
                child: Text(
                  errorMessage,
                  textAlign: TextAlign.center,
                  // style: Theme.of(context)
                  //     .textTheme
                  //     .caption
                  //     .copyWith(fontWeight: FontWeight.w500),

                  // style: showButton? Theme.of(context).textTheme.bodyText2.copyWith(
                  //   fontSize: 16, color: Theme.of(context).primaryColor):
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .copyWith(fontWeight: FontWeight.w500),
                ),
              ),
              showButton
                  ? Expanded(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              onOkay();
                            },
                            child: Text(
                              'OK',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(
                                      color: Theme.of(context).accentColor),
                            )),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
