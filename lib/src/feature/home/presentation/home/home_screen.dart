import 'package:flutter/material.dart';
import 'package:prueba_tecnica/src/common/theme/colors.dart';
import 'package:prueba_tecnica/src/feature/home/presentation/my_videos/my_videos_screen.dart';
import 'package:prueba_tecnica/src/feature/home/presentation/profile/profile_screen.dart';
import 'package:prueba_tecnica/src/feature/home/presentation/videos/videos_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController();
  int currentPages = 0;

  List<Widget> views = [
    const VideosScreen(),
    const MyVideosScreen(),
    const ProfileScreen(),
  ];
  @override
  void initState() {
    // homeBloc = HomeBloc()..add(GetHomeEvent());
    super.initState();
  }

  @override
  void dispose() {
    // homeBloc.close();
    super.dispose();
  }

  void onTapChangePage(int pageIndex) {
    pageController.jumpToPage(
      pageIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   centerTitle: true,
        //   title: Hero(
        //     tag: 'Librería Antioquia',
        //     child: Text(
        //       'Librería Antioquia',
        //       style: Theme.of(context).textTheme.titleLarge,
        //     ),
        //   ),
        // ),
        body: PageView.builder(
          itemCount: views.length,
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              currentPages = index;
            });
          },
          itemBuilder: (_, index) {
            return views[index];
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPages,
          onTap: onTapChangePage,
          unselectedItemColor: AppColors.iconUnSelect,
          selectedItemColor: AppColors.iconSelect,
          selectedLabelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.iconSelect,
              ),
          unselectedLabelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.iconUnSelect,
              ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Mis videos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Perfil',
            ),
          ],
          // selectedItemColor: AppColors.primaryColor,
          // unselectedItemColor: AppColors.textColor,
          // showUnselectedLabels: true,
        )
        // body: Column(
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.all(10),
        //       child: TextField(
        //         controller: controller,
        //         keyboardType: TextInputType.text,
        //         onTapOutside: (value) {
        //           FocusScope.of(context).unfocus();
        //         },
        //         decoration: StyleTextField.inputDecoration(
        //           context,
        //           hintText: 'Buscar',
        //           isDense: true,
        //           prefixIcon: const Icon(
        //             Icons.search,
        //             color: AppColors.textColor,
        //           ),
        //         ),
        //         onChanged: (value) {
        //           if (value.isEmpty) {
        //             homeBloc.add(HomeInitialEvent());
        //           } else {
        //             homeBloc.add(SearchHomeEvent(value));
        //           }
        //         },
        //       ),
        //     ),
        //     Expanded(
        //       child: BlocBuilder<HomeBloc, HomeState>(
        //         bloc: homeBloc,
        //         builder: (context, state) {
        //           // Estado para mostar carga de datos
        //           if (state is HomeLoadingState) {
        //             return const Center(
        //               child: CircularProgressIndicator(),
        //             );
        //             // estado para mostrar error
        //           } else if (state is HomeErrorState) {
        //             return NoData(
        //               message: state.message,
        //               onPressed: () {
        //                 homeBloc.add(GetHomeEvent());
        //               },
        //             );
        //             // estado para mostrar busqueda
        //           } else if (state is HomeSearchState) {
        //             // en caso de que no haya datos
        //             if (state.searchbooksModel.isEmpty) {
        //               return const NoData(
        //                 image: imageNotFound,
        //                 message: 'No hay datos ',
        //               );
        //             }
        //             return ListView.builder(
        //               itemCount: state.searchbooksModel.length,
        //               itemBuilder: (context, index) {
        //                 return Padding(
        //                   padding: const EdgeInsets.symmetric(
        //                     horizontal: 10,
        //                     vertical: 10,
        //                   ),
        //                   child: BookCard(
        //                     bookModel: state.searchbooksModel[index],
        //                     homeBloc: homeBloc,
        //                   ),
        //                 );
        //               },
        //             );
        //           } else if (state.booksModel.isEmpty) {
        //             return NoData(
        //               image: imageNotFound,
        //               message: 'No hay datos',
        //               onPressed: () {
        //                 homeBloc.add(GetHomeEvent());
        //               },
        //             );
        //           } else {
        //             return ListView.builder(
        //               itemCount: state.booksModel.length,
        //               itemBuilder: (context, index) {
        //                 return Padding(
        //                   padding: const EdgeInsets.symmetric(
        //                     horizontal: 10,
        //                     vertical: 10,
        //                   ),
        //                   child: BookCard(
        //                     bookModel: state.booksModel[index],
        //                     homeBloc: homeBloc,
        //                   ),
        //                 );
        //               },
        //             );
        //           }
        //         },
        //       ),
        //     ),
        //   ],
        // ),
        );
  }
}
