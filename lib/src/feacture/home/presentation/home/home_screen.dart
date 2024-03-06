import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica/src/feacture/errors/widgets/no_data.dart';
import 'package:prueba_tecnica/src/feacture/home/data/bloc/home_bloc.dart';
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
          child: Text('Catbreeds'),
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
          } else if (state.homeModel.isEmpty) {
            return NoData(
              image: imageNotFound,
              message: 'No hay datos',
              onPressed: () {
                homeBloc.add(GetHomeEvent());
              },
            );
          } else {
            return ListView.builder(
              itemCount: state.homeModel.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.homeModel[index].name ?? ''),
                  subtitle: Text(state.homeModel[index].description ?? ''),
                );
              },
            );
          }
        },
      ),
    );
  }
}
