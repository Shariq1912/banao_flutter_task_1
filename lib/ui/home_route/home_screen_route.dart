import 'package:banao_flutter_task_1/blocs/programs_bloc.dart';
import 'package:banao_flutter_task_1/blocs/programs_state.dart';
import 'package:banao_flutter_task_1/ui/home_route/home_route_widgets/event_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../blocs/programs_event.dart';
import '../../dependency_injection.dart';
import '../../models/data_helper.dart';
import 'home_route_widgets/build_button.dart';
import 'home_route_widgets/widget_Card.dart';

class HomeRoute extends StatelessWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ProgramsBloc>(
            create: (BuildContext context) => getIt<ProgramsBloc>(),
          ),
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<ProgramsBloc, ProgramState>(
              listener: (context, state) {
                if (state is ProgramStateSuccess) {
                  print("object");
                }
              },
            ),
          ],
          child: HomeScreen(),
        ));
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    print("called");
    context.read<ProgramsBloc>().add(GetProgramListEvent());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    context.read<ProgramsBloc>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProgramsBloc, ProgramState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is ProgramStateLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ProgramStateFailed) {
          return const Center(child: Text("Error"));
        }
        if (state is ProgramStateSuccess) {
          return Scaffold(
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
                                buildButton(
                                    'Program', 'assets/images/prog.png'),
                                const SizedBox(width: 12),
                                buildButton(
                                    'Get Help', 'assets/images/prog.png'),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                buildButton(
                                    'Learn  ', 'assets/images/prog.png'),
                                const SizedBox(width: 12),
                                buildButton(
                                    'DD Tracker', 'assets/images/prog.png'),
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
                      itemCount: state.apiModel.items.length,
                      itemBuilder: (context, index) {
                        final data = state.apiModel.items[index];
                        return ProgramCard(
                          imagePath: 'assets/images/img1.png',
                          category: data.category,
                          title: data.name!,
                          //subtitle: data['subtitle']!,
                          lessons: data.lesson.toString(),
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
                      itemCount: state.apiModel.items.length,
                      itemBuilder: (context, index) {
                        final data = state.apiModel.items[index];
                        return EventCard(
                          imagePath: 'assets/images/img1.png',
                          category: data.category,
                          title: data.name!,
                          //subtitle: data['subtitle']!,
                          lessons: data.lesson.toString(),
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
                            GestureDetector(
                              onTap: () {
                                // Handle the click event here
                                // For example, you can navigate to another screen or perform some action
                                // when the text is clicked.
                                context.pushNamed("gridview");
                              },
                              child: Text(
                                'View all',
                                style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                  ),
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
          );
        }
        return const SizedBox();
      },
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
