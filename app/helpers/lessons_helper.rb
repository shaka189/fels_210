module LessonsHelper
  def result_status answer
    case
      when answer.nil?
        "default"
      when answer.correct
        "success"
      else
        "danger"
    end
  end

  def result_lesson lesson
    "#{[lesson.answers.answer_correct.size, lesson.answers.size].join("/")} #{I18n.t("words")}"
  end
end
