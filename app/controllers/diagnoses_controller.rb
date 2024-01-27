class DiagnosesController < ApplicationController
  skip_before_action :require_login, only: [:new, :index ]
  def new
    @questions = Question.all.includes(:answers).order(id: :asc)
  end

  def index
    # ユーザーの回答の answer_id を配列で int 型で格納する
    @user_answers_array = params[:answers].reject(&:blank?).map(&:to_i)
  
    # @match_dogに該当するdog_idとカウントをハッシュ形式で格納していく
    @match_dog = []

    # ユーザーの回答（answer_id）と、DogAnswerRerationship の answer_id が合致するレコードを全て取得する
    @matching_records = DogAnswerRerationship.none  # 空のActiveRecordリレーションを作成する
    @user_answers_array.each do |user_answer|  
      matching_records_for_answer = DogAnswerRerationship.where(answer_id: user_answer)
      @matching_records = @matching_records.or(matching_records_for_answer)  # 合致するレコードを追加
    end

    # 取得したレコードに対して dog_id 毎にカウントを取る
    count_by_dog_id = @matching_records.group(:dog_id).count

    # ハッシュに格納
    count_by_dog_id.each do |dog_id, match_count|
      dog = Dog.find_by(id: dog_id)
      @match_dog << { dog_id: dog_id, match_count: match_count, breed: dog.breed }
    end
  end
end
