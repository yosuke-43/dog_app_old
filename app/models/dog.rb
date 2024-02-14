class Dog < ApplicationRecord
    #uploaderクラスの紐付け
    mount_uploader :dog_image, DogImageUploader
    #外部キーの設定
    belongs_to :dog_size_type
    belongs_to :dog_country
    has_many :dog_answer_rerationships, dependent: :destroy
    has_many :answers, through: :dog_answer_rerationships
    has_many :boards

    #バリデーションの設定
    validates :breed, presence: true

    #enumの設定
    enum hair_length: { short_hair: 0, medium_hair: 1, long_hair: 2, short_or_long_hair: 3 }
    enum activity_level: { low_activity_level: 0, middle_activity_level: 1, high_activity_level: 2 }
    enum solitude_tolerance: { low_solitude_tolerance: 0, middle_solitude_tolerance: 1, high_solitude_tolerance: 2 }
    enum care_difficulty: { easy_care_difficulty: 0, middle_care_difficulty: 1, difficult_care_difficulty: 2 }     
    
    #attr_accessor(一時的なカラム、DB保存なし)の設定
    attr_accessor :temp_count

    #ransackの検索機能を使うために下記のメソッドを追加、どの属性や関連を検索可能とするかを指定する
    #特にこれは属性に関しての記述
    def self.ransackable_attributes(auth_object = nil)
        ["activity_level", "breed", "care_difficulty", "catchphrase", "created_at", "dog_country_id", "dog_image", "dog_size_type_id", "features_sentence", "hair_length", "height", "history_sentence", "id", "id_value", "personality_sentence", "recommended_for_whom", "solitude_tolerance", "updated_at", "weight"]
    end
    
end
