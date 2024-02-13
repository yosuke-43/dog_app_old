class DiagnosesController < ApplicationController
  skip_before_action :require_login, only: [:new, :index ]
  def new
    @questions = Question.all.includes(:answers).order(id: :asc)
  end

  def index
    # ユーザーの回答の question.answersの:idを配列であるanswersに格納されているので、int型で格納しなおす
    @user_answers_array = params[:answers].reject(&:blank?).map(&:to_i)
  
    # @match_dogに該当するdog_idとカウントをハッシュ形式で格納していく
    @dog_with_temp_count_array = []

    # ユーザーの回答（answer_id）と、DogAnswerRerationship の answer_id が合致するレコードを全て取得する
    @matching_records = DogAnswerRerationship.none  # 空のActiveRecordリレーションを作成する
    @user_answers_array.each do |user_answer|  
      matching_records_for_answer = DogAnswerRerationship.where(answer_id: user_answer)
      @matching_records = @matching_records.or(matching_records_for_answer)  # 合致するレコードを追加
    end

    # 取得したレコードに対して dog_id 毎にカウントを取る,格納されている形はハッシュで、{dog_id: count}の形で格納されている
    count_by_dog_id = @matching_records.group(:dog_id).count

    # attr_accessorの:temp_countにマッチした回答数を格納する
    count_by_dog_id.each do |dog_id, match_count|
      dog_with_temp_count = Dog.find_by(id: dog_id)
      dog_with_temp_count.temp_count = match_count
      @dog_with_temp_count_array << dog_with_temp_count
    end

    # 最大のtemp_count(回答マッチ数)の値を取得する
    max_temp_count = @dog_with_temp_count_array.map(&:temp_count).max
    # 最大のtemp_countを持つ犬種のみに絞る
    @recommend_dogs = @dog_with_temp_count_array.select { |dog| dog.temp_count == max_temp_count }
  end
end
