class NotifyAkismetOfUpdatedCommentSpamStatusJob < ApplicationJob
  queue_as :default

  def perform(comment_id)
    comment = Comment.find(comment_id)

    if comment.is_spam?
      comment.ham! # Akismet
      comment.not_spam! # Local
    else
      comment.spam! # Akismet
      comment.is_spam! # Local
    end

    comment.save!
  end
end
