class CheckCommentForSpamJob < ApplicationJob
  queue_as :default

  def perform(comment_id)
    comment = Comment.find(comment_id)
    comment.set_local_spam_status!
  end
end
