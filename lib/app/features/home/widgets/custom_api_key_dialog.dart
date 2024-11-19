import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomApiKeyDialog extends StatelessWidget {
  final TextEditingController apiKeyController =
      TextEditingController(text: "AIzaSyCF4YWonXcJUPWDqXNuL4wOSf2O2MCguw4");
  final void Function(String) onPressed;
  final GlobalKey<FormState>? formKey = GlobalKey(debugLabel: "api_key_form");

  CustomApiKeyDialog({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SizedBox(
        height: Get.height * 0.1,
        child: Dialog(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enter your API KEY",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: apiKeyController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey?.currentState?.validate() ?? true) {
                        onPressed(apiKeyController.text);
                      }
                      return;
                    },
                    child: const Text("Submit"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
