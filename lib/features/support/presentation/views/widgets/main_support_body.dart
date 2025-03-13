import 'package:flutter/material.dart';
import 'package:flutter_easy_faq/flutter_easy_faq.dart';
import 'package:quizdent/core/constants/app_assets.dart';
import 'package:quizdent/core/strings/app_strings.dart';
import 'package:quizdent/core/strings/screen_strings/strings_of_support_screen.dart';
import 'package:quizdent/core/strings/strings_of_errors.dart';
import 'package:quizdent/core/utils/app_routes.dart';
import 'package:url_launcher/url_launcher.dart';
import 'support_list_tile.dart';

class MainSupportBody extends StatelessWidget {
  const MainSupportBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Image.asset(AppAssets.support),
          const SizedBox(height: 100),
          SupportListTile(
            icon: Icons.chat,
            title: "Send a message",
            onTap: (){
              Navigator.pushNamed(context, AppRoutes.kContactUsScreen);
            }
          ),
          SupportListTile(
            icon: Icons.chat_outlined,
            title: StringsOfSupportScreen.chatWhatsappWord,
            onTap: () async {
              // Launch Whatsapp chat with appropriate phone number
              final Uri url = Uri.parse('https://wa.me/${AppStrings.whatsappNum}');
              if (await canLaunchUrl(url)) {
                await launchUrl(url, mode: LaunchMode.externalApplication);
              } else {
                // Handle the case where Whatsapp isn't installed or can't be launched
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(StringsOfErrors.noWhatsappApp),
                  ),
                );
              }
            },
            infraText: AppStrings.whatsappNum,
          ),
          SupportListTile(
            icon: Icons.mail_outline,
            title: "Send us an Email",
            onTap: () async {
              // Launch email composer with appropriate email address
              final Uri url = Uri.parse('mailto:${AppStrings.emailAddress}?subject=DentFlow User Inquiry'); // Uri format for mailto link
              if (await canLaunchUrl(url)) {
                await launchUrl(url, mode: LaunchMode.externalApplication);
              } else {
                // Handle the case where email app isn't installed or can't be launched
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Email app not found or cannot be opened'),
                  ),
                );
              }
            },
            infraText: AppStrings.emailAddress,
          ),
          const SizedBox(height: 20,),
          const Text("Frequently Asked Questions", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),),
          const Divider(),
          const SizedBox(height: 20,),
          EasyFaq(
            question: 'What is the American Center in Cairo (ACC)?',
            answer: 'The American Center in Cairo (ACC) is a cultural and educational hub that promotes mutual understanding between the United States and Egypt. It offers a wide range of programs, resources, and services to the public, including libraries, workshops, and cultural events.',
          ),
          const SizedBox(height: 20),
          EasyFaq(
            question: 'Where is the American Center in Cairo located?',
            answer: 'The American Center in Cairo is located at [Insert Address Here]. It is easily accessible and offers a welcoming environment for visitors.',
          ),
          const SizedBox(height: 20),
          EasyFaq(
            question: 'What services does the ACC offer?',
            answer: 'The ACC offers a variety of services, including access to a well-equipped library, English language learning resources, cultural programs, workshops, and events. It also provides information about studying in the United States and other educational opportunities.',
          ),
          const SizedBox(height: 20),
          EasyFaq(
            question: 'Is the American Center in Cairo open to the public?',
            answer: 'Yes, the American Center in Cairo is open to the public. Everyone is welcome to visit and take advantage of its resources, programs, and events.',
          ),
          const SizedBox(height: 20),
          EasyFaq(
            question: 'Does the ACC offer English language courses?',
            answer: 'Yes, the ACC provides resources and programs to help individuals improve their English language skills. This includes access to language learning materials, workshops, and conversation clubs.',
          ),
          const SizedBox(height: 20),
          EasyFaq(
            question: 'How can I stay updated about ACC events and programs?',
            answer: 'You can stay updated about ACC events and programs by visiting their official website, following their social media pages, or subscribing to their newsletter. The ACC regularly updates its calendar with upcoming events and activities.',
          ),
          const SizedBox(height: 20),
          EasyFaq(
            question: 'Can I access the ACC library?',
            answer: 'Yes, the ACC library is open to the public. It offers a wide range of books, magazines, and digital resources on various topics, including American culture, history, and literature.',
          ),
          const SizedBox(height: 20),
          EasyFaq(
            question: 'Does the ACC provide information about studying in the United States?',
            answer: 'Yes, the ACC offers resources and guidance for individuals interested in studying in the United States. This includes information about universities, scholarships, and the application process.',
          ),
          const SizedBox(height: 20),
          EasyFaq(
            question: 'Are there any membership fees to use the ACC facilities?',
            answer: 'No, there are no membership fees to use the ACC facilities. All resources and programs are free and open to the public.',
          ),
          const SizedBox(height: 20),
          EasyFaq(
            question: 'How can I contact the American Center in Cairo?',
            answer: 'You can contact the ACC by visiting their website, calling their office, or sending an email. Their contact information is available on their official website.',
          ),

        ],
      ),
    );
  }
}
