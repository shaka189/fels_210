class RemindLessonMailer < ApplicationMailer

  def remind_lesson lesson
    @lesson = lesson
    mail to: lesson.user.email, subject: "Finish Lesson Now"
  end
end
