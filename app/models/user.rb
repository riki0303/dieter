class User < ApplicationRecord
  include Discard::Model

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :fitlogs, dependent: :destroy
  has_one :profile, dependent: :destroy

  validates :email, presence: true, uniqueness: true

  # deviceのメソッドをオーバーライド
  def active_for_authentication?
    super && !discarded?
  end

  def withdraw
    ActiveRecord::Base.transaction do
      # 関連レコードを削除
      fitlogs.each(&:destroy!)
      profile&.destroy!

      # ユーザーを論理削除
      discard
    end
  end
end
