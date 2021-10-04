class PresentLikeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    like_name = ['life_id', 'it_id', 'area_id','science_id', 'sports_id', 'entertainment_id','economy_id']
    like_values = like_name.map { |name| record.__send__("like_#{name}") }

    unless like_values.include?(true)
      record.errors[attribute] << (options[:message] || 'を選択してください。')
    end
  end
end