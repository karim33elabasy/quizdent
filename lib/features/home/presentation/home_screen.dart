import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizdent/core/constants/app_colors.dart';
import 'package:quizdent/core/constants/sizes.dart';
import 'package:quizdent/core/strings/screen_strings/strings_of_home.dart';
import 'package:quizdent/core/strings/strings_of_errors.dart';
import 'package:quizdent/core/utils/app_routes.dart';
import 'package:quizdent/core/widgets/dialogs/show_my_dialog.dart';
import 'package:quizdent/features/authentication/data/models/user_model.dart';
import 'package:quizdent/features/home/presentation/widgets/home_screen_tabs/tabs_list.dart';
import '../data/models/speaker_model.dart';
import 'managers/events_cubit/events_cubit.dart';
import 'managers/events_cubit/events_states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Future<void> addAccEventsToFirestore() async {
      // Reference to the Firestore collection
      CollectionReference eventsCollection = FirebaseFirestore.instance.collection('events');

      // List of event data
      List<Map<String, dynamic>> events = [
        {
          'title': 'ACC.25 Annual Scientific Session & Expo',
          'subtitle': 'Transforming Cardiovascular Care',
          'description': 'Join us for ACC.25 at the McCormick Place Convention Center in Chicago, IL, from March 29 – 31, 2025. Engage with peers globally and learn the latest updates in cardiovascular care.',
          'date': "2025-03-08T08:53:53.223667",
          'location': 'Chicago, IL',
          'fees': 500.0,
          'photo': 'https://accscientificsession.acc.org/-/media/Images/ACC/Scientific-Sessions/2025/ACC25-Logo.jpg',
          'status': 'upcoming',
          'createdAt': "2025-03-08T08:53:53.223667",
          'updatedAt': "2025-03-08T08:53:53.223667",
          'createdBy': 'admin',
          'speakers': ['speaker1', 'speaker2'],
          'categoryId': 'conference',
          'organizedBy': 'American College of Cardiology',
        },
        {
          'title': 'Triumphs and Challenges in Advanced Heart Failure Management',
          'subtitle': 'Webinar on Heart Failure',
          'description': 'A webinar discussing the latest advancements and challenges in managing advanced heart failure.',
          'date': "2025-03-08T08:53:53.223667",
          'location': 'Online',
          'fees': 0.0,
          'photo': 'https://www.acc.org/-/media/ACC/Images/2024/Webinar-Heart-Failure.jpg',
          'status': 'upcoming',
          'createdAt': "2025-03-08T08:53:53.223667",
          'updatedAt': "2025-03-08T08:53:53.223667",
          'createdBy': 'admin',
          'speakers': ['speaker3'],
          'categoryId': 'webinar',
          'organizedBy': 'American College of Cardiology',
        },
        // Add more events as needed
      ];

      // Add each event to Firestore
      for (var event in events) {
        await eventsCollection.add(event);
      }
    }

    Future<void> addSpeakersToFirestore() async {
      // مرجع مجموعة الـ speakers في Firestore
      CollectionReference speakersCollection = FirebaseFirestore.instance.collection('speakers');

      // قائمة بيانات المتحدثين الوهمية
      List<SpeakerModel> speakers = [
        SpeakerModel(
          id: 'spk1',
          name: 'Dr. John Smith',
          photo: 'https://example.com/photos/john_smith.jpg',
          bio: 'Cardiologist specializing in heart failure and transplantation.',
          email: 'john.smith@example.com',
          createdAt: DateTime.now(),
          createdBy: 'admin',
        ),
        SpeakerModel(
          id: 'spk2',
          name: 'Dr. Emily Johnson',
          photo: 'https://example.com/photos/emily_johnson.jpg',
          bio: 'Expert in interventional cardiology and coronary artery disease.',
          email: 'emily.johnson@example.com',
          createdAt: DateTime.now(),
          createdBy: 'admin',
        ),
        SpeakerModel(
          id: 'spk3',
          name: 'Dr. Michael Brown',
          photo: 'https://example.com/photos/michael_brown.jpg',
          bio: 'Specialist in electrophysiology and arrhythmia treatment.',
          email: 'michael.brown@example.com',
          createdAt: DateTime.now(),
          createdBy: 'admin',
        ),
        SpeakerModel(
          id: 'spk4',
          name: 'Dr. Sarah Lee',
          photo: 'https://example.com/photos/sarah_lee.jpg',
          bio: 'Pediatric cardiologist focusing on congenital heart defects.',
          email: 'sarah.lee@example.com',
          createdAt: DateTime.now(),
          createdBy: 'admin',
        ),
        SpeakerModel(
          id: 'spk5',
          name: 'Dr. Robert White',
          photo: 'https://example.com/photos/robert_white.jpg',
          bio: 'Renowned for research in preventive cardiology and lifestyle medicine.',
          email: 'robert.white@example.com',
          createdAt: DateTime.now(),
          createdBy: 'admin',
        ),
        SpeakerModel(
          id: 'spk6',
          name: 'Dr. Linda Adams',
          photo: 'https://example.com/photos/linda_adams.jpg',
          bio: 'Specialist in hypertension and heart disease prevention.',
          email: 'linda.adams@example.com',
          createdAt: DateTime.now(),
          createdBy: 'admin',
        ),
      ];

      // إضافة كل متحدث إلى Firestore
      for (var speaker in speakers) {
        await speakersCollection.add(speaker.toJson());
      }
    }

    final EventsCubit eventsCubit = context.read<EventsCubit>();
    final homeTabsList = homeTabs(eventsCubit: eventsCubit);
    return DefaultTabController(
      length: homeTabsList.length,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){}, icon: const Icon(Icons.menu,color: AppColors.white,)),
          actions: [
            IconButton(onPressed: (){Navigator.pushNamed(context, AppRoutes.kProfileScreen,arguments: UserModel.fake());}, icon: Icon(Icons.notifications,color: AppColors.white,)),
          ],
          centerTitle: true,
          backgroundColor: AppColors.primary,
          title: Text(StringsOfHome.homeTitle,style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 22,color: AppColors.white),),
          bottom: TabBar(
            isScrollable: true,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.white,
            tabs: homeTabsList.map((item) => Tab(text: item.title,)).toList(),
          ),
        ),
        body: SafeArea(
          minimum: const EdgeInsets.symmetric(
            vertical: Sizes.md,
            horizontal: Sizes.md,
          ),
          child: BlocConsumer<EventsCubit,EventsStates>(
            builder: (context, state) {
              return TabBarView(
                children: homeTabsList.map((item) => item.body).toList(),
              );
            },
            listener: (context,state){
              if(state is EventsStatesFailure) ShowMyDialog.showErrorDialog(context: context, title: StringsOfErrors.gettingHomeDataError, message: state.errorMessage);
            },
          ),
        ),
      ),
    );
  }
}