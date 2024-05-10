import 'package:custom_image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica/src/feature/errors/widgets/no_data.dart';
import 'package:prueba_tecnica/src/feature/home/domain/models/books_model.dart';
import 'package:prueba_tecnica/src/feature/home/state/bloc/home_bloc.dart';
import 'package:prueba_tecnica/src/utils/image_app.dart';

class BookDetailScreen extends StatefulWidget {
  const BookDetailScreen({
    required this.bookModel,
    required this.homeBloc,
    this.lastText,
    super.key,
  });
  static const String routeName = 'bookDetailt';
  final BookModel bookModel;
  final HomeBloc homeBloc;
  // para identificar el texto con el cual se hizo la busqueda
  // y guardarlo en el historial
  final String? lastText;

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  @override
  void initState() {
    widget.homeBloc.add(GetDetailEvent(widget.bookModel.isbn13));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Detalle del libro',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        bloc: widget.homeBloc,
        builder: (context, state) {
          if (state is HomeLoadingDetailState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeErrorState) {
            return NoData(
              image: imageNotFound,
              message: 'Ups! algo salio mal, intenta de nuevo.',
              onPressed: () {
                widget.homeBloc.add(GetDetailEvent(widget.bookModel.isbn13));
              },
            );
          } else if (state is HomeLoadedDetailState) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CustomImage(
                              widget.bookModel.image,
                              height: 100,
                              width: 100,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.bookModel.title,
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                  // precio
                                  Text(
                                    widget.bookModel.price,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        if (state.bookModel.detailBooksModel != null)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _detail(
                                context,
                                icon: Icons.business,
                                title:
                                    state.bookModel.detailBooksModel!.publisher,
                              ),
                              _detail(
                                context,
                                icon: Icons.language,
                                title:
                                    state.bookModel.detailBooksModel!.language,
                              ),
                              _detail(
                                context,
                                icon: Icons.confirmation_number,
                                title: state.bookModel.detailBooksModel!.isbn10,
                              ),
                              _detail(
                                context,
                                icon: Icons.confirmation_number,
                                title: state.bookModel.detailBooksModel!.isbn13,
                              ),
                              _detail(
                                context,
                                icon: Icons.pages,
                                title:
                                    // ignore: lines_longer_than_80_chars
                                    ' Total paginas ${state.bookModel.detailBooksModel!.pages}',
                              ),
                              _detail(
                                context,
                                icon: Icons.calendar_today,
                                title: state.bookModel.detailBooksModel!.year,
                              ),
                              _detail(
                                context,
                                icon: Icons.star,
                                title: state.bookModel.detailBooksModel!.rating,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(Icons.description),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        state.bookModel.detailBooksModel!.desc,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return NoData(
            image: imageNotFound,
            message:
                // ignore: lines_longer_than_80_chars
                'Parece que no hay datos o no se ha cargado el detalle del libro, Intenta de nuevo.',
            onPressed: () {
              widget.homeBloc.add(GetDetailEvent(widget.bookModel.isbn13));
            },
          );
        },
      ),
    );
  }

  Widget _detail(
    BuildContext context, {
    required IconData icon,
    required String title,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ],
      ),
    );
  }
}
