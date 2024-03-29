import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:mailer/smtp_server/gmail.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/size.dart';
import 'package:my_portfolio/widgets/custom_text_filed.dart';
import 'package:universal_html/js.dart' as js;
import 'package:my_portfolio/constants/sns_links.dart';
//import 'package:mailer/mailer.dart';
import 'package:http/http.dart' as http;

class ContactSection extends StatelessWidget {
  ContactSection({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  void sendEmail() async {
    final name = nameController.text;
    final email = emailController.text;
    final message = messageController.text;

    // Create a JSON object with the variables
    Map<String, dynamic> jsonBody = {
      'name': name,
      'email': email,
      'message': message,
    };

    try {
      // 将JSON主体转换为字符串
      String jsonString = jsonEncode(jsonBody);

      final response = await http.post(
        Uri.parse(
            'http://localhost:3000/send-email'), // Replace with your mock server URL
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonString,
      );
      if (response.statusCode == 200) {
        print('Email sent successfully');
        print('Name: $name');
        print('Email: $email');
        print('Message: $message');
      } else {
        print('Failed to send email: ${response.statusCode}');
      }
    } catch (e) {
      print('Error sending email: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: CustomColor.bgLight1,
      child: Column(
        children: [
          //title
          Text(
            "Get in touch",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: CustomColor.whitePrimary),
          ),

          const SizedBox(height: 50),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
              maxHeight: 100,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth >= kMinDesktopWidth) {
                  return buildNameEmailFieldDesktop();
                }

                //else

                return buildNameEmailFieldMobile();
              },
            ),
          ),
          const SizedBox(height: 15),

          // Message
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
            ),
            child: CustomTextField(
              controller: messageController,
              hintText: "Your message",
              maxLines: 16,
            ),
          ),
          const SizedBox(height: 20),

          //Send Button
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
            ),
            child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                //onPressed: () {},
                onPressed: sendEmail,
                child: const Text("Get in touch"),
              ),
            ),
          ),
          const SizedBox(height: 30),

          ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 300,
              ),
              child: const Divider()),
          const SizedBox(height: 15),
          //SNS icon button links
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SnsLinks.facebook]);
                },
                child: Image.asset(
                  "assets/facebook.png",
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SnsLinks.github]);
                },
                child: Image.asset(
                  "assets/github.png",
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SnsLinks.instagram]);
                },
                child: Image.asset(
                  "assets/instagram.png",
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SnsLinks.linkedIn]);
                },
                child: Image.asset(
                  "assets/linkedin.png",
                  width: 28,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Row buildNameEmailFieldDesktop() {
    return Row(
      children: [
        //name
        Flexible(
          child: CustomTextField(
            controller: nameController,
            hintText: "Your name",
          ),
        ),
        const SizedBox(width: 15),
        //email
        Flexible(
          child: CustomTextField(
            controller: emailController,
            hintText: "Your email",
          ),
        ),
      ],
    );
  }

  Column buildNameEmailFieldMobile() {
    return Column(
      children: [
        //name
        Flexible(
          child: CustomTextField(
            controller: nameController,
            hintText: "Your name",
          ),
        ),
        const SizedBox(height: 15),
        //email
        Flexible(
          child: CustomTextField(
            controller: emailController,
            hintText: "Your email",
          ),
        ),
      ],
    );
  }
}
