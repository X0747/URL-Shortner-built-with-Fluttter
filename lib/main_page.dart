import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:url_shortner/logic.dart';

final displayLong = ValueNotifier<String?>("");

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final urlcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var bounds = MediaQuery.of(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Aditya's URL Shortner"),
          SizedBox(height: bounds.size.height * 0.05),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: bounds.size.width * 0.7,
                height: bounds.size.height * 0.1,
                padding: const EdgeInsets.all(5),
                child: TextField(
                  decoration: const InputDecoration(
                      hintText: "Enter Url", hintStyle: TextStyle()),
                  controller: urlcontroller,
                ),
              ),
            ],
          ),
          SizedBox(height: bounds.size.height * 0.04),
          OutlinedButton.icon(
            onPressed: () {
              if (urlcontroller.text.contains("https://")||urlcontroller.text.contains("www")&&
                  urlcontroller.text != ""
                  ) {
                displayLong.value = urlcontroller.text;
                shortenUrl(urlcontroller.text,context);
              } else {
                
              }
            },
            icon: const Icon(Icons.bolt),
            label: const Text(
              ("Flash"),
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          SizedBox(height: bounds.size.height * 0.05),
          Row(
            children: [
              SizedBox(width: bounds.size.width * 0.1),
              ValueListenableBuilder(
                valueListenable: displayLong,
                builder: (context, value, child) {
                  return Visibility(
                    visible: checkVisibility(value),
                    child: Flexible(
                      child: Text(
                        "Entered URL : $value",
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          SizedBox(height: bounds.size.height * 0.05),
          ValueListenableBuilder(
            valueListenable: shortLink,
            builder: (context,value,child) {
              return Visibility(
                visible: checkVisibility(value),
                child: Row(
                  children: [
                    SizedBox(width: bounds.size.width * 0.1),
                    Text(
                            "Shortened URL : $value"),
                    IconButton(
                      onPressed: () {
                        FlutterClipboard.copy(shortLink.value);
                      },
                      icon: const Icon(Icons.copy),
                    ),
                  ],
                ),
              );
            }
          )
        ],
      ),
    );
  }
}
