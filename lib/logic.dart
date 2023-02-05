
import 'package:flutter/material.dart';
import 'package:flutter_shortener/flutter_shortener.dart';

final shortLink = ValueNotifier<String>("");

Future<void> shortenUrl(String url, BuildContext ctx) async {
  try {
    progressDialog(true, ctx);
    final shortener =
        BitLyShortener(accessToken: "45ba51b451bfaf9008a7f5c0796de6ea0c4daed9");
    final linkData = await shortener.generateShortLink(longUrl: url);
    shortLink.value = linkData.link.toString();
    progressDialog(false, ctx);
  } on BitLyException{
    shortLink.value = "Error!!!  Please Try Again";
  }
}

bool checkVisibility(value) {
  if (value == "") {
    return false;
  } else {
    return true;
  }
}

progressDialog(bool isLoading, BuildContext context) {
  AlertDialog dialog = AlertDialog(
    content: SizedBox(
        height: MediaQuery.of(context).size.height*0.1,
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              CircularProgressIndicator(),
              Padding(padding: EdgeInsets.only(left: 15.0)),
              Text("Please wait")
            ],
          ),
        )),
    contentPadding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
  );
  if (!isLoading) {
    Navigator.of(context).pop();
  } else {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }
}
