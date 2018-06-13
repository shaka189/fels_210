class NotifyFinishLessonJob < ApplicationJob
  queue_as :default

  def perform lesson
    RemindLessonMailer.remind_lesson(lesson).
      deliver unless lesson.status
  end
end
