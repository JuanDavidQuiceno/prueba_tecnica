// import 'package:custom_image/custom_image.dart';
// import 'package:flutter/material.dart';
// import 'package:prueba_tecnica/src/feature/home/domain/models/books_model.dart';
// import 'package:prueba_tecnica/src/feature/home/presentation/home/book_detail.dart/book_detail_screen.dart';
// import 'package:prueba_tecnica/src/feature/home/state/bloc/home_bloc.dart';

// class BookCard extends StatelessWidget {
//   const BookCard({
//     required this.bookModel,
//     required this.homeBloc,
//     super.key,
//   });
//   final BookModel bookModel;
//   final HomeBloc homeBloc;

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.zero,
//       child: InkWell(
//         borderRadius: BorderRadius.circular(10),
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute<void>(
//               settings: const RouteSettings(name: BookDetailScreen.routeName),
//               builder: (context) => BookDetailScreen(
//                 bookModel: bookModel,
//                 homeBloc: homeBloc,
//               ),
//             ),
//           );
//         },
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Row(
//             children: [
//               CustomImage(
//                 bookModel.image,
//                 height: 60,
//                 width: 60,
//               ),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       bookModel.title,
//                       style: Theme.of(context).textTheme.titleSmall,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     if (bookModel.subtitle.isNotEmpty)
//                       Text(
//                         bookModel.subtitle,
//                         style: Theme.of(context).textTheme.bodyMedium,
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     Text(
//                       bookModel.price,
//                       style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                             fontWeight: FontWeight.bold,
//                           ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
