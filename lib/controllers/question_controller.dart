import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import '../models/questions.dart';

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  late AnimationController _animationController;

  /* method to allow access from outside */
  late Animation _animation;
  Animation get animation => this._animation;

  late PageController _pageController;
  PageController get pageController => this._pageController;

  List<Question> _questions = sample_data
      .map((question) => Question(
          answer: question['answer_index'],
          id: question['id'],
          options: question['options'],
          question: question['question']))
      .toList();
  List<Question> get questions => this._questions;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  late int _correctAnswer;
  int get correctAnswer => this._correctAnswer;

  late int _selectedAnswer;
  int get selectedAnswer => this._selectedAnswer;

  int _numberOfCorrectAnswers = 0;
  int get numberOfCorrectAnswers => this._numberOfCorrectAnswers;

  /* What the heck is this? */
  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  /* similar to component did mount */
  @override
  void onInit() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 60));
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        update();
      });

    _animationController.forward().whenComplete(nextQuestion);
    _pageController = PageController();
    super.onInit();
  }

  /* similar to component will unmount */
  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  void checkAnswer(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAnswer = question.answer;
    _selectedAnswer = selectedIndex;

    if (_correctAnswer == _selectedAnswer) {
      _numberOfCorrectAnswers++;
    }

    _animationController.stop();
    update();

    Future.delayed(Duration(seconds: 3), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);

      /* return the counter to default value */
      _animationController.reset();

      _animationController.forward().whenComplete(nextQuestion);
    } else {
      /* get to score screen */
    }
  }

  void updateQuestionNumber(int index) {
    _questionNumber.value = index + 1;
  }
}
