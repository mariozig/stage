class CheckCommentForSpamJob < ApplicationJob
  queue_as :default

  def perform(comment_id)
    comment = Comment.find(comment_id)
    comment.update_spam_status!
  end
end
