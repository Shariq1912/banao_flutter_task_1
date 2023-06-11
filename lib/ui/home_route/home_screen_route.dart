import 'package:banao_flutter_task_1/ui/home_route/home_route_widgets/event_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/data_helper.dart';
import 'home_route_widgets/build_button.dart';
import 'home_route_widgets/widget_Card.dart';

class HomeRoute extends StatelessWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length:0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(""),
          leading: IconButton(
            icon: Image.asset('assets/images/menu.png'),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: Image.asset('assets/images/forum.png'),
              onPressed: () {
                context.pushNamed("refine");
              },
            ),
            IconButton(
              icon: Image.asset('assets/images/notifi.png'),
              onPressed: () {
                context.pushNamed("refine");
              },
            ),
            const Text(" ")
          ],
          backgroundColor: const Color(0xFFFFFFFF),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                children: [
                  Container(
                    color: const Color(0xFFEEF3FD),
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello, Priya!",
                          style: GoogleFonts.lora(
                            textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Text(

                          "What do you wanna learn today",
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            buildButton('Program','assets/images/prog.png'),
                            const SizedBox(width: 12),
                            buildButton('Get Help','assets/images/prog.png'),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            buildButton('Learn  ','assets/images/prog.png'),
                            const SizedBox(width: 12),
                            buildButton('DD Tracker','assets/images/prog.png'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Programs for you",
                      style: GoogleFonts.lora(
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'View all',
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ), // <-- Text
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          // <-- Icon
                          Icons.arrow_forward,
                          size: 16.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 18),
                height: 282,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: ProgramData.programData.length,
                  itemBuilder: (context, index) {
                    final data = ProgramData.programData[index];
                    return ProgramCard(
                      imagePath: data['imagePath']!,
                      category: data['category']!,
                      title: data['title']!,
                      //subtitle: data['subtitle']!,
                      lessons: data['lessons']!,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Events and experiences",
                      style: GoogleFonts.lora(
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'View all',
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ), // <-- Text
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          // <-- Icon
                          Icons.arrow_forward,
                          size: 16.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 18),
                height: 296,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: ProgramData.programData2.length,
                  itemBuilder: (context, index) {
                    final data = ProgramData.programData2[index];
                    return EventCard(
                      imagePath: data['imagePath']!,
                      category: data['category']!,
                      title: data['title']!,
                      //subtitle: data['subtitle']!,
                      lessons: data['lessons']!,
                    );
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Lessons for you",
                      style: GoogleFonts.lora(
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'View all',
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ), // <-- Text
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          // <-- Icon
                          Icons.arrow_forward,
                          size: 16.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 18),
                height: 282,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: ProgramData.programData2.length,
                  itemBuilder: (context, index) {
                    final data = ProgramData.programData2[index];
                    return ProgramCard(
                      imagePath: data['imagePath']!,
                      category: data['category']!,
                      title: data['title']!,
                      //subtitle: data['subtitle']!,
                      lessons: data['lessons']!,
                    );
                  },
                ),
              ),


            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                color: Colors.grey,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.menu_book,
                color: Colors.grey,
              ),
              label: 'Learn',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.window_sharp,
                color: Colors.grey,
              ),
              label: 'Hub',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
                color: Colors.grey,
              ),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.sentiment_satisfied_alt_outlined,
                color: Colors.grey,
              ),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          unselectedLabelStyle:
              const TextStyle(color: Colors.grey, fontSize: 14),
          fixedColor: Colors.grey,
          showSelectedLabels: true,
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


}
