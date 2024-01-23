import 'package:flutter/material.dart';
import 'package:goroga/core/app_export.dart';
import 'package:goroga/presentation/home_page/controller/survey_controller.dart';
import 'package:goroga/presentation/home_page/models/survey_model.dart';
import 'package:goroga/widgets/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SurveyDialog extends StatefulWidget {
  @override
  State<SurveyDialog> createState() => _SurveyDialogState();
}

class _SurveyDialogState extends State<SurveyDialog> {
  final Uri _dataPrivacy =
      Uri.parse('https://goroga.in/pages/privacy-policy.php');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: CustomImageView(
                  imagePath: ImageConstant.imageLogo,
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width / 2,
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://makebot-v3.s3.ap-south-1.amazonaws.com/goroga/thumbnail/4_Meditations.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Keep track of your stress.\n",
                        style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Urbanist'),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        "This biweekly survey will help you track how your stress levels change over time, what causes your stress, and how it affects your life.",
                        // style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,style: TextStyle(fontFamily: 'Urbanist'),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Privacy\n",
                        style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Urbanist'),
                      ),
                      // Text(
                      //   "Your privacy is important to us, and your data kept confidential.",
                      //   style: TextStyle(fontFamily: 'Urbanist'),
                      // ),
                      TextButton(
                          onPressed: () {
                            launchUrl(_dataPrivacy);
                          },
                          child: Text(
                            
                            "Read our Privacy Policy",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: const Color.fromARGB(255, 33, 65, 243),
                                fontFamily: 'Urbanist'),
                                
                          )),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      text: "Start Survey",
                      onTap: () {
                        Get.back();
                        Get.to(() => Questions());
                       
                      },
                      width: getSize(120),
                    ),
                  
                    SizedBox(width: 10),
                    CustomButton(
                      text: "Skip survey",
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      width: getSize(120),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Questions extends StatefulWidget {
  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  SurveyController _surveyController = Get.put(SurveyController());
  Map<int, bool> isOtherSelected = {};
  Map<int, TextEditingController> otherOptionControllers = {};
  List<String> answers = [];

  // int? selectedOptionIndex;
  List<Map<String, dynamic>> ansSurveyData = [];
  Map<int, int> selectedSubQueOpts = {};
  Future<SurveyModel>? fetchSurveyDataFun;
  TextEditingController _textEditingController = TextEditingController();
  int? dropvalue;
  var items = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchSurveyDataFun = SurveyData();
  }

  var init = 0;
  Future<SurveyModel> SurveyData() async {
    // print("call" + init.toString());
    var surveyData;
    try {
      surveyData = await _surveyController.fetchSurveyData();
      if (!(init > 0)) {
        print("data of survey");
        for (var element in surveyData.data!) {
          List<Map<String, dynamic>> subQuestions = [];

          for (var subelement in element.subQue) {
            subQuestions
                .add({"subquestion_id": subelement.id, "suboption_id": ""});
            // for (var options in subelement) {
            //   if(options.title! == "Other"){
            //     otherOptionControllers.add(TextEditingController());
            //     isOtherSelected.assign(subelement.id, false);
            //   }
            // }
          }
          for (var options in element.ans) {
            if (options.title! == "Other") {
              print("other found");
              otherOptionControllers[element.id] = TextEditingController();
              isOtherSelected[element.id] = false;
            }
          }
          if (element.questionType == "multiple") {
            ansSurveyData.add({
              "question_id": element.id,
              'answer_id': [],
              'sub_questions': subQuestions,
              'text': ""
            });
          } else {
            ansSurveyData.add({
              "question_id": element.id,
              'answer_id': " ",
              'sub_questions': subQuestions,
              'text': ""
            });
          }
        }
      }
      print(isOtherSelected);
      init++;
      return surveyData;
    } catch (e) {
      print("error:$e");
      throw e;
    }
  }

  Map<String, dynamic> selectedAnswers = {};
  void onAnswerSelected(String que, String ans) {
    setState(() {
      selectedAnswers[que] = ans;
    });
    // print(selectedAnswers);
  }

  bool isAnswerSelected(String questionId, String answerId) {
    if (selectedAnswers.containsKey(questionId) &&
        selectedAnswers[questionId] == answerId) {
      return true;
    } else {
      return false;
    }
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        body: Column(
          children: <Widget>[
            Container(
              child: CustomImageView(
                imagePath: ImageConstant.imageLogo,
                height: MediaQuery.of(context).size.height / 9,
                width: MediaQuery.of(context).size.width / 2,
                fit: BoxFit.contain,
              ),
            ),
            Expanded(
              child: FutureBuilder(
                  // future: SurveyData(),
                  future: fetchSurveyDataFun,
                  builder: (context, AsyncSnapshot<SurveyModel> snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text("${snapshot.error}"));
                    } else if (snapshot.hasData) {
                      List<Data>? questions = snapshot.data!.data;

                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: questions!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            elevation: 4.0,
                            child: Padding(
                              padding: EdgeInsets.all(25.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '${index + 1}' +
                                        '.' +
                                        ' ' +
                                        questions[index].title.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                    textAlign: TextAlign.justify,
                                  ),
                                  SizedBox(height: 20),
                                  if (questions[index].ans!.length == 2)
                                    ToggleSwitch(
                                      borderWidth: 0.2,
                                      minWidth: 70.0,
                                      minHeight: 50,
                                      cornerRadius: 30.0,
                                      activeBgColors: [
                                        [ColorConstant.primary],
                                        [ColorConstant.primary],
                                      ],
                                      activeFgColor: Colors.white,
                                      inactiveBgColor: Colors.grey.shade200,
                                      inactiveFgColor: Colors.grey,
                                      initialLabelIndex: selectedAnswers[
                                                      questions[index]
                                                          .id
                                                          .toString()] !=
                                                  null &&
                                              selectedAnswers[questions[index]
                                                      .id
                                                      .toString()] ==
                                                  questions[index]
                                                      .ans![0]
                                                      .id
                                                      .toString()
                                          ? 0
                                          : selectedAnswers[questions[index]
                                                          .id
                                                          .toString()] !=
                                                      null &&
                                                  selectedAnswers[
                                                          questions[index]
                                                              .id
                                                              .toString()] ==
                                                      questions[index]
                                                          .ans![1]
                                                          .id
                                                          .toString()
                                              ? 1
                                              : null,
                                      totalSwitches: 2,
                                      labels: questions[index]
                                          .ans!
                                          .map((ans) => ans.title.toString())
                                          .toList(),
                                      radiusStyle: true,
                                      onToggle: (value) {
                                        if (value != null) {
                                          setState(() {
                                            // selectedOptionIndex = value;
                                            ansSurveyData[index]['answer_id'] =
                                                questions[index].ans![value].id;
                                          });

                                          onAnswerSelected(
                                            questions[index].id.toString(),
                                            questions[index]
                                                .ans![value]
                                                .id
                                                .toString(),
                                          );
                                        }
                                      },
                                    )
                                  else if (questions[index].ans!.isNotEmpty)
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: List.generate(
                                        questions[index].ans!.length,
                                        (optionIndex) {
                                          final answerId = questions[index]
                                              .ans![optionIndex]
                                              .id;
                                          // print(answerId);

                                          return Container(
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    if (questions[index]
                                                            .questionType ==
                                                        "multiple")
                                                      Checkbox(
                                                        value: answers.contains(
                                                            answerId
                                                                .toString()),
                                                        activeColor:
                                                            ColorConstant
                                                                .primary,
                                                        onChanged: (newValue) {
                                                          print(questions[index]
                                                              .ans![optionIndex]
                                                              .title);
                                                          setState(() {
                                                            if (newValue !=
                                                                null) {
                                                              if (newValue) {
                                                                answers.add(answerId
                                                                    .toString());
                                                                // print(
                                                                //     ansSurveyData);
                                                              } else {
                                                                answers.remove(
                                                                    answerId
                                                                        .toString());
                                                                // print(
                                                                //     ansSurveyData);
                                                              }
                                                              ansSurveyData[
                                                                          index]
                                                                      [
                                                                      "answer_id"] =
                                                                  answers
                                                                      .toString();
                                                              print(
                                                                  ansSurveyData);
                                                            }

                                                            if (questions[index]
                                                                    .ans![
                                                                        optionIndex]
                                                                    .title ==
                                                                "Other") {
                                                              isOtherSelected[
                                                                  questions[
                                                                          index]
                                                                      .id!] = true;
                                                              print(
                                                                  isOtherSelected);
                                                            } else {
                                                              isOtherSelected[
                                                                  questions[
                                                                          index]
                                                                      .id!] = false;
                                                              otherOptionControllers[
                                                                      questions[
                                                                              index]
                                                                          .id!]!
                                                                  .clear();
                                                              ansSurveyData[
                                                                      index]
                                                                  ["text"] = "";
                                                            }
                                                          });
                                                        },
                                                      )
                                                    else
                                                      Radio<int>(
                                                        value: questions[index]
                                                            .ans![optionIndex]
                                                            .id!,
                                                        activeColor:
                                                            ColorConstant
                                                                .primary,
                                                        groupValue: selectedAnswers[
                                                                    questions[
                                                                            index]
                                                                        .id
                                                                        .toString()] !=
                                                                null
                                                            ? int.tryParse(
                                                                selectedAnswers[
                                                                    questions[
                                                                            index]
                                                                        .id
                                                                        .toString()]!)
                                                            : null,
                                                        onChanged: (newValue) {
                                                          print(newValue);
                                                          ansSurveyData[index][
                                                                  'answer_id'] =
                                                              newValue;
                                                          print(ansSurveyData);
                                                          onAnswerSelected(
                                                            questions[index]
                                                                .id
                                                                .toString(),
                                                            newValue.toString(),
                                                          );

                                                          setState(() {
                                                            if (questions[index]
                                                                    .ans![
                                                                        optionIndex]
                                                                    .title ==
                                                                "Other") {
                                                              isOtherSelected[
                                                                  questions[
                                                                          index]
                                                                      .id!] = true;
                                                              print(
                                                                  isOtherSelected);
                                                            } else {
                                                              isOtherSelected[
                                                                  questions[
                                                                          index]
                                                                      .id!] = false;
                                                              otherOptionControllers[
                                                                      questions[
                                                                              index]
                                                                          .id!]!
                                                                  .clear();
                                                              ansSurveyData[
                                                                      index]
                                                                  ["text"] = "";
                                                            }
                                                            // print(
                                                            //     isOtherSelected);
                                                            // selectedOptionIndex =
                                                            //     newValue;
                                                          });
                                                          // print(ansSurveyData);
                                                        },
                                                      ),
                                                    Text(
                                                      questions[index]
                                                          .ans![optionIndex]
                                                          .title
                                                          .toString(),
                                                    ),
                                                  ],
                                                ),
                                                // isOtherSelected ?
                                                if (questions[index]
                                                        .ans![optionIndex]
                                                        .title ==
                                                    "Other")
                                                  isOtherSelected[
                                                              questions[index]
                                                                      .id ??
                                                                  0] ==
                                                          true
                                                      ? Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 40.0),
                                                          child: TextFormField(
                                                            controller:
                                                                otherOptionControllers[
                                                                    questions[
                                                                            index]
                                                                        .id!],
                                                            decoration:
                                                                InputDecoration(
                                                              border:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(),
                                                              ),
                                                            ),
                                                            onChanged: (value) {
                                                              ansSurveyData[
                                                                          index]
                                                                      ['text'] =
                                                                  value;
                                                              print(
                                                                  ansSurveyData);
                                                            },
                                                          ),
                                                        )
                                                      : Container()
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  else if (questions[index].ans!.isEmpty &&
                                      questions[index].subQue!.length > 0)
                                    //sub Quesitons UI Start
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: List.generate(
                                        questions[index].subQue!.length,
                                        (subQuesIndex) {
                                          return Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 10),
                                            decoration: BoxDecoration(
                                                color: subQuesIndex % 2 == 0
                                                    ? Colors.white
                                                    : Colors.grey.shade200),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                      questions[index]
                                                          .subQue![subQuesIndex]
                                                          .title
                                                          .toString(),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: List.generate(
                                                        questions[index]
                                                            .subQue![
                                                                subQuesIndex]
                                                            .subOpt!
                                                            .length,
                                                        (subQueAnsIndex) {
                                                          // print(selctedRadioOptionIndex);
                                                          return Container(
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        10),
                                                            child: Row(
                                                              children: [
                                                                Radio<int>(
                                                                  value: questions[index]
                                                                          .subQue![
                                                                              subQuesIndex]
                                                                          .subOpt![
                                                                              subQueAnsIndex]
                                                                          .id ??
                                                                      0,
                                                                  activeColor:
                                                                      ColorConstant
                                                                          .primary,
                                                                  groupValue: selectedSubQueOpts[questions[
                                                                          index]
                                                                      .subQue![
                                                                          subQuesIndex]
                                                                      .id!],
                                                                  onChanged:
                                                                      (newValue) {
                                                                    setState(
                                                                        () {
                                                                      selectedSubQueOpts[
                                                                          questions[index]
                                                                              .subQue![
                                                                                  subQuesIndex]
                                                                              .id!] = newValue
                                                                          as int;
                                                                      print(
                                                                          "change index");
                                                                      print(
                                                                          selectedSubQueOpts);
                                                                    });
                                                                    setState(
                                                                        () {
                                                                      ansSurveyData[index]['sub_questions'][subQuesIndex]
                                                                              [
                                                                              'suboption_id'] =
                                                                          newValue;
                                                                    });
                                                                  },
                                                                ),
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Text(
                                                                    questions[
                                                                            index]
                                                                        .subQue![
                                                                            subQuesIndex]
                                                                        .subOpt![
                                                                            subQueAnsIndex]
                                                                        .suboptionTitle
                                                                        .toString(),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  else if (questions[index].ans!.isEmpty &&
                                      questions[index].subQue!.isEmpty &&
                                      questions[index].questionType == "rating")
                                    DropdownButtonFormField<int>(
                                        icon: Icon(Icons.arrow_drop_down),
                                        hint: Text('Tap to rate here....'),
                                        value: dropvalue,
                                        items: items.map((int item) {
                                          return DropdownMenuItem<int>(
                                            value: item,
                                            child: Text(item.toString()),
                                          );
                                        }).toList(),
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide.none),
                                          filled: true,
                                        ),
                                        onChanged: (int? newValue) {
                                          setState(() {
                                            dropvalue = newValue;
                                            ansSurveyData[index]['answer_id'] =
                                                newValue;
                                            // onAnswerSelected(
                                            //   questions[index].id.toString(),
                                            //   newValue.toString(),
                                            // );

                                            print(selectedAnswers);
                                          });
                                        })
                                  else if (questions[index].ans!.isEmpty &&
                                      questions[index].subQue!.isEmpty &&
                                      questions[index].questionType == "text")
                                    TextFormField(
                                      autovalidateMode: AutovalidateMode.always,
                                      minLines: 6,
                                      controller: _textEditingController,
                                      keyboardType: TextInputType.multiline,
                                      maxLines: null,
                                      cursorColor: ColorConstant.primary,
                                      onChanged: (value) {
                                        setState(() {
                                          // selectedQue = index;
                                          // print(value);
                                          ansSurveyData[index]['text'] = value;
                                          onAnswerSelected(
                                            questions[index].id.toString(),
                                            value,
                                          );
                                        });
                                      },
                                      decoration: InputDecoration(
                                        filled: true,
                                        hintText: 'Type your answer here....',
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // TextButton(
                  //   style: TextButton.styleFrom(
                  //     shape: RoundedRectangleBorder(
                  //       side:
                  //           BorderSide(color: ColorConstant.primary, width: 1.0),
                  //       borderRadius: BorderRadius.circular(0),
                  //     ),
                  //   ),
                  //   onPressed: () {},
                  //   child: Text(
                  //     "hii",
                  //     // '$answered/$totalQuestionsCount Answered',
                  //     style: TextStyle(color: Colors.black54),
                  //     textAlign: TextAlign.justify,
                  //   ),
                  // ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: ColorConstant.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      // print("this is submit button ");
                      // print(otherOptionControllers.length);
                      // print(ansSurveyData);
                      _surveyController.send_data(ansSurveyData);
                      Get.back();
                      // Get.offAll(()=>HomeContainerScreen());
                      //  Navigator.of(context).pop();
                      // Get.toNamed(AppRoutes.homeContainerScreen);
                      // Navigator.push(context, MaterialPageRoute(
                      //   builder: (context) {
                      //     return HomeContainerScreen();
                      //   },
                      // ));
                    },
                    child: Text('Submit Survey'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
