// import 'package:flutter/material.dart';
// import 'package:userapp/models/fruits_response.dart';
// import 'package:userapp/services/fruits_api.dart';

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 "Discover",
//                 style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//               ),
//               const Text(
//                 "Find intresting article and news",
//                 style: TextStyle(color: Colors.grey),
//               ),
//               const SizedBox(height: 20),
//               Expanded(
//                 child: FutureBuilder<List<Nutritions>>(
//                   future: FruitsApiServices().fetchFruitsDetails(),
//                   builder: (context, snapshot) {
//                     if (!snapshot.hasData) {
//                       return const Center(child: CircularProgressIndicator());
//                     } else {
//                       String fruitResponse = snapshot as String;
//                       return ListView.builder(
//                         itemBuilder: (context, index) {
//                           return NewsTile(name: fruitResponse);
//                         },
//                       );
//                     }
//                   },
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class NewsTile extends StatelessWidget {
//   final String name;

//   const NewsTile({Key? key, required this.name}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(7),
//       child: ListTile(
//         title: Text(
//           name,
//           maxLines: 2,
//           overflow: TextOverflow.ellipsis,
//         ),
//         subtitle: Text(
//           name,
//           maxLines: 4,
//           overflow: TextOverflow.ellipsis,
//         ),
//       ),
//     );
//   }
// }
