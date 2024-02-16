import 'package:flutter/material.dart';
import 'package:quiz_app/question_summary/summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return SummaryItem(itemData: data);
          }).toList(),
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';

// class QuestionsSummary extends StatelessWidget {
//   const QuestionsSummary(this.summaryData, {super.key});

//   final List<Map<String, Object>> summaryData;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: summaryData.map((data) {
//         return Row(
//           children: [
//             Text(((data['quesion_index'] as int) + 1).toString()),
//             const SizedBox(width: 10), // Add some space between index and text
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text((data['question']).toString()),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   Text(
//                       "Correct Answer: ${(data['correct_answer']).toString()}"),
//                   Text("User Answer: ${(data['user_answer']).toString()}"),
//                 ],
//               ),
//             )
//           ],
//         );
//       }).toList(),
//     );
//   }
// }
