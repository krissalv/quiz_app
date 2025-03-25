import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {

    return Column(
      children: summaryData.map((data) {
        final int questionIndex = data['question_index'] as int;
        final circleColor = data['circle_color'] as Color;
        
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: circleColor, //gets color based off whether the answer is correct or incorrect
                radius: 20,
                child: Text('${questionIndex + 1}', 
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),

              Expanded(
                child: Column( //switched to column to prevent overflow more easily versus row
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['question'] as String,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                      overflow: TextOverflow.visible,
                      softWrap: true,
                    ),
                    Text(
                      'Your answer: ${data['user_answer']}',
                      style: TextStyle(
                        fontSize: 16, 
                        color: Color.fromARGB(255, 13, 0, 55),
                      ),
                      overflow: TextOverflow.visible,
                      softWrap: true,
                    ),
                    Text(
                      'Correct answer: ${data['correct_answer']}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 141, 219, 255),
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.visible,
                      softWrap: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
