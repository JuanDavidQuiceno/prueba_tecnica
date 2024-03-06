import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica/src/common/theme/colors.dart';
import 'package:prueba_tecnica/src/common/theme/inputs/style_text_field.dart';
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
  TextEditingController controller = TextEditingController();
  @override
  // ignore: always_declare_return_types, type_annotate_public_apis
  initState() {
    homeBloc = HomeBloc()..add(GetHomeEvent());
    super.initState();
  }

  @override
  // ignore: always_declare_return_types, type_annotate_public_apis
  dispose() {
    homeBloc.close();
    controller.dispose();
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.text,
              onTapOutside: (value) {
                FocusScope.of(context).unfocus();
              },
              decoration: StyleTextField.inputDecoration(
                context,
                hintText: 'Buscar',
                isDense: true,
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppColors.textColor,
                ),
              ),
              onChanged: (value) {
                homeBloc.add(SearchHomeEvent(value));
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<HomeBloc, HomeState>(
              bloc: homeBloc,
              builder: (context, state) {
                // Estado para mostar carga de datos
                if (state is HomeLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                  // estado para mostrar error
                } else if (state is HomeErrorState) {
                  return NoData(
                    message: state.message,
                    onPressed: () {
                      homeBloc.add(GetHomeEvent());
                    },
                  );
                  // estado para mostrar busqueda
                } else if (state is HomeSearchState) {
                  // en caso de que no haya datos
                  if (state.catModelSearch.isEmpty) {
                    return const NoData(
                      image: imageNotFound,
                      message: 'No hay datos',
                    );
                  }
                  return ListView.builder(
                    itemCount: state.catModelSearch.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: CatCard(
                          catModel: state.catModelSearch[index],
                        ),
                      );
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
                  return ListView.builder(
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
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
