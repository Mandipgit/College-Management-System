import 'package:flutter/material.dart';
import 'package:teachers/Dashhboard/dashboard.dart';
import 'package:teachers/Theme/theme_provider.dart';

final questionController = TextEditingController();
final optioncontroller = TextEditingController();

class test_Page extends StatefulWidget {
  final String testfaculty;
  final String testSemester;
  final String testYear;
  const test_Page(
      {required this.testfaculty,
      required this.testSemester,
      required this.testYear});

  @override
  State<test_Page> createState() => _test_PageState();
}

class _test_PageState extends State<test_Page> {
  List<Map<String, dynamic>> question = [
    {
      'questionText': '',
      'option': [
        {'text': '', 'isCorrect': false},
        {'text': '', 'isCorrect': false},
        {'text': '', 'isCorrect': false},
        {'text': '', 'isCorrect': false},
      ]
    }
  ];
  void addQuestion() {
    setState(() {
      question.add({
        'questionText': '',
        'option': [
          {'text': '', 'isCorrect': false},
          {'text': '', 'isCorrect': false},
          {'text': '', 'isCorrect': false},
          {'text': '', 'isCorrect': false},
        ]
      });
    });
  }

  void deleteQuestion(int index) {
    setState(() {
      question.removeAt(index);
    });
  }

  void addOption(int questionindex) {
    setState(() {
      (question[questionindex]['option'] as List).add({
        'text': '',
        'isCorrect': false,
      });
    });
  }

  void deleteOption(int questionindex, int optionindex) {
    setState(() {
      (question[questionindex]['option'] as List).removeAt(optionindex);
    });
  }

  void markCorrectOption(int questionIndex, int optionIndex) {
    setState(() {
      final options = question[questionIndex]['option'] as List;
      for (int i = 0; i < options.length; i++) {
        options[i]['isCorrect'] = i == optionIndex;
      }
    });
  }

  Widget buildQuestionCard(int qIndex) {
    var questions = question[qIndex];
    var options = questions['option'] as List;

    return Card(
      elevation:4,
      color: mode?(primarygrey):(Colors.white),
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              initialValue: questions['questionText'],
              decoration: InputDecoration(labelText: 'Question'),
              onChanged: (value) {
                question[qIndex]['questionText'] = value;
              },
            ),
            SizedBox(height: 10),
            ...List.generate(options.length, (oIndex) {
              return Row(
                children: [
                  Radio<int>(
                    value: oIndex,
                    groupValue:
                        options.indexWhere((opt) => opt['isCorrect'] == true),
                    onChanged: (int? value) {
                      if (value != null) {
                        markCorrectOption(qIndex, value);
                      }
                    },
                  ),
                  Expanded(
                    child: TextFormField(
                      initialValue: options[oIndex]['text'],
                      decoration:
                          InputDecoration(labelText: 'Option ${oIndex + 1}'),
                      onChanged: (val) {
                        options[oIndex]['text'] = val;
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      deleteOption(qIndex, oIndex);
                    },
                  ),
                ],
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
              onPressed: () => addOption(qIndex),
              icon: Icon(Icons.add),
              label: Text("Add Option",
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
              ),
            ),
            TextButton.icon(
              onPressed: () => deleteQuestion(qIndex),
              icon: Icon(Icons.delete_forever),
              label: Text("Delete Question",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: (Colors.red),
              ),
              ),
            ),
              ],
            )
            
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("Test",
            style: TextStyle(
              color: Colors.white,
            )),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Dashboardpage()));
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.secondary,
              ),
              child: Center(
                child: Text(
                  (widget.testfaculty == "BSc.CSIT" ||
                          widget.testfaculty == "BIT")
                      ? "${widget.testfaculty}(${widget.testSemester})"
                      : "${widget.testfaculty}(${widget.testYear})",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: question.length,
                itemBuilder: (context, index) => buildQuestionCard(index),
              ),
            ),
            const SizedBox(height:10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation:4,
                  color: mode?(primarygrey):(blueColor),
                  child: IconButton(onPressed: (){
                    setState(() {
                      addQuestion();
                    });
                  }, icon: Icon(Icons.add),
                  iconSize: 20,
                  color: Colors.white,
                  ),
                ),
                const SizedBox(width:10,),
                Card(
                  elevation:4,
                  color: mode?(primarygrey):(blueColor),
                  child: TextButton(onPressed: (){}, child: Text("Publish",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                  )),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
