import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica/src/feature/errors/widgets/no_data.dart';
import 'package:prueba_tecnica/src/feature/home/data/bloc/home_bloc.dart';
import 'package:prueba_tecnica/src/feature/home/widgets/cat_card.dart';
import 'package:prueba_tecnica/src/utils/image_app.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeBloc homeBloc;
  @override
  // ignore: always_declare_return_types, type_annotate_public_apis
  initState() {
    homeBloc = HomeBloc()..add(GetHomeEvent());
    super.initState();
  }

  @override
  // ignore: always_declare_return_types, type_annotate_public_apis
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Hero(
          tag: 'Catbreeds',
          child: Text(
            'Catbreeds',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        bloc: homeBloc,
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeErrorState) {
            return NoData(
              message: state.message,
              onPressed: () {
                homeBloc.add(GetHomeEvent());
              },
            );
          } else if (state.catModel.isEmpty) {
            return NoData(
              image: imageNotFound,
              message: 'No hay datos',
              onPressed: () {
                homeBloc.add(GetHomeEvent());
              },
            );
          } else {
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.catModel.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: CatCard(
                          catModel: state.catModel[index],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
