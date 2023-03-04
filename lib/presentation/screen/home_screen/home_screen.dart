import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_test/business_logic/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:movies_test/presentation/rotutes/router.dart';
import 'package:movies_test/presentation/screen/foods/foods.dart';
import 'package:movies_test/utils/my_const/color.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../business_logic/bottom_navigation/bottom_navigation_event.dart';
import '../../../business_logic/bottom_navigation/bottom_navigation_state.dart';
import '../../../utils/my_const/assets.dart';
import '../../../utils/my_const/build_bottom.dart';
import '../../../utils/my_const/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showDialog();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ColorHelper.splashColor,
        appBar: AppBar(
          centerTitle: true,
          title: Container(
            width: 150,
            decoration: BoxDecoration(
                color: const Color(0xFF3D3D3D),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: ButtonsTabBar(
                contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                height: 30,
                buttonMargin: EdgeInsets.zero,
                backgroundColor: Colors.white,
                unselectedBackgroundColor: const Color(0xFF3D3D3D),
                unselectedLabelStyle: const TextStyle(color: Colors.white),
                labelStyle: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                tabs: const [
                  Tab(
                    text: "Movies",
                  ),
                  Tab(
                    text: "Foods",
                  ),
                ],
              ),
            ),
          ),
          backgroundColor: ColorHelper.splashColor,
          elevation: 0,
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.more_vert),
            ),
          ],
        ),
        drawer: const BuildDrawer(),
        body: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
          builder: (BuildContext context, BottomNavigationState state) {
            if (state is PageLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is FirstPageLoaded) {
              return Foods();
            }
            if (state is SecondPageLoaded) {
              return HomeScreen();
            }

            return TabBarView(
              children: [
                SingleChildScrollView(
                  child: body(context),
                ),
                // const Foods(),
                const Foods(),
              ],
            );
          },
        ),
        bottomNavigationBar:
            BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
                builder: (BuildContext context, BottomNavigationState state) {
          return BottomNavigationBar(
            currentIndex: context
                .select((BottomNavigationBloc bloc) => bloc.currentIndex),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.black),
                label: 'First',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.all_inclusive, color: Colors.black),
                label: 'Second',
              ),
            ],
            onTap: (index) => context
                .read<BottomNavigationBloc>()
                .add(PageTapped(index: index)),
          );
        }),
      ),
    );
  }

  Widget body(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Container(
                width: 280,
                decoration: BoxDecoration(
                  color: const Color(0xFF3D3D3D),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextFormField(
                  controller: searchController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(15.0, 5.0, 10.0, 5.0),
                    border: InputBorder.none,
                    labelText: 'Search your Favourite',
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              20.widthBox,
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: ColorHelper.red,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: FaIcon(
                    FontAwesomeIcons.magnifyingGlass,
                    size: 25,
                    color: ColorHelper.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        10.heightBox,
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Found 1 result",
                style: GoogleFonts.ptMono(
                  color: ColorHelper.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
        30.heightBox,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AppRouter.MOVIES_DETAILS);
                },
                child: Image.asset(Assets.shared.spiderMan),
              ),
            ],
          ),
        ),
        20.heightBox,
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Spider Man- Home coming",
                style: GoogleFonts.ptMono(
                  color: ColorHelper.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget body1() {
    return const Text(
      "No",
      style: TextStyle(color: Colors.white),
    );
  }

  void _showDialog() {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () => Navigator.pop(context, 'Cancel'),
    );
    Widget continueButton = TextButton(
      child: const Text("Ok"),
      onPressed: () => Navigator.pop(context, 'Ok'),
    );
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => Theme(
        data: Theme.of(context)
            .copyWith(dialogBackgroundColor: ColorHelper.splashColor),
        child: AlertDialog(
          title: Text(
            'Enable push notification',
            style: GoogleFonts.actor(
              color: ColorHelper.white,
            ),
          ),
          content: Text(
            'Be notified when new movies are realeased instantly',
            style: GoogleFonts.ptMono(
              color: ColorHelper.white,
            ),
          ),
          actions: <Widget>[
            cancelButton,
            continueButton,
          ],
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
