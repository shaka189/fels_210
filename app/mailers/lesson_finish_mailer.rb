class LessonFinishMailer < ApplicationMailer

  def send_mail_finish_lesson lesson
    @user = lesson.user
    @lesson = lesson
    mail to: @user.email, subject: "Lesson Finish"
  end
end
