import 'package:banao_flutter_task_1/ui/home_route/home_route_widgets/widget_Card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../blocs/lesson/lesson_bloc.dart';
import '../../blocs/lesson/lesson_event.dart';
import '../../blocs/lesson/lesson_state.dart';
import '../../dependency_injection.dart';
import 'home_route_widgets/event_card.dart';

class GridRoute extends StatelessWidget {
  const GridRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<LessonBloc>(
            create: (BuildContext context) => getIt<LessonBloc>(),
          ),
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<LessonBloc, LessonState>(listener: (context, state) {
              if (state is LessonStateSuccess) {
                print("object");
              }
            })
          ],
          child: GridScreen(),
        ));
  }
}

class GridScreen extends StatefulWidget {
  const GridScreen({Key? key}) : super(key: key);

  @override
  State<GridScreen> createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    print("called");
    context.read<LessonBloc>().add(GetLessonsListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LessonBloc, LessonState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is LessonStateLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is LessonStateFailed) {
          return const Center(child: Text("Error"));
        }
        if (state is LessonStateSuccess) {
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
                  onPressed: () {},
                ),
                IconButton(
                  icon: Image.asset('assets/images/notifi.png'),
                  onPressed: () {},
                ),
                const Text(" ")
              ],
              backgroundColor: const Color(0xFFFFFFFF),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 18),
                    height: 700,
                    child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: state.apiModelLesson.items?.length,
                        itemBuilder: (context, index) {
                          final data = state.apiModelLesson.items?[index];
                          return ProgramCard(
                            imagePath: 'assets/images/img1.png',
                            category: data!.category,
                            title: trimString(data.name),
                            //subtitle: data['subtitle']!,
                            lessons: data.duration.toString(),
                          );
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 18,
                                mainAxisExtent: 300,
                                mainAxisSpacing: 18),

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

  String trimString(String? input) {
    if (input!.length <= 25) {
      return input;
    } else {
      return input.substring(0, 25);
    }
  }
}
