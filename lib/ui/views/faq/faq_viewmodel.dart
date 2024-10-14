import 'package:regardless_site/extensions/hover_extensions.dart';

import '../../common/app_strings.dart';
import '../base/view_model.dart';

class FaqViewModel extends ViewModel {
  List<FaqTopic> get faqTopics {
    return faqs.entries.map((entry) {
      final title = entry.key.capitalize();
      final faqList = (entry.value).map((faqData) {
        return Faq(
          question: faqData['question'] ?? '',
          answer: faqData['answer'] ?? '',
        );
      }).toList();
      return FaqTopic(title: title, faqs: faqList);
    }).toList();
  }
}

class Faq {
  final String question;
  final String answer;

  Faq({required this.question, required this.answer});
}

class FaqTopic {
  final String title;
  final List<Faq> faqs;

  FaqTopic({required this.title, required this.faqs});
}
