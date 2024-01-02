class Question {
  String? questiontext;
  List<Answer>? answerList;
  Question(
    this.questiontext,
    this.answerList,
  );
}

class Answer {
  String? text;
  bool? isCorrect;
  Answer(
    this.text,
    this.isCorrect,
  );
}

List<Question> getQuestion() {
  List<Question> list = [];
  list.add(
    Question("Who is owner of Iphone ?", [
      Answer('Google', false),
      Answer('Microsoft', false),
      Answer('Apple', true),
      Answer('Oppo', false),
    ]),
  );
  list.add(
    Question("Who is owner of Flutter ?", [
      Answer('Nokia', false),
      Answer('Google', true),
      Answer('Samsung', false),
      Answer('Huawei', false),
      Answer('Apple', false),
    ]),
  );
  list.add(
    Question("Youtube is ------ platform ?", [
      Answer('Music Sharing', false),
      Answer('Video Sharing', false),
      Answer('Live Streaming', false),
      Answer('All of the above', true),
    ]),
  );
  list.add(
    Question("Sharks are mammals ?", [
      Answer('True', false),
      Answer('False', true),
    ]),
  );

  return list;
}
