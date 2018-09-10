module CommentsHelper
  def spam_or_ham(comment)
    if comment.is_spam?
      OpenStruct.new(text: 'Ham', enum_value: 'not_spam')
    elsif comment.not_spam?
      OpenStruct.new(text: 'Spam', enum_value: 'is_spam')
    end
  end
end
