class Trip < ApplicationRecord
  include Shareable
  
  belongs_to :user, touch: true

  has_many :days, -> { order(date: :asc) }, dependent: :destroy
  has_many :happenings, -> { order(time: :asc) }, dependent: :destroy
  has_many :lodgings
  has_many :sometimes, -> { order(completed: :asc, created_at: :desc) }
  
  has_one :active_label, dependent: :destroy
  
  delegate :transportations, :activities, to: :happenings
  
  broadcasts_refreshes

  def length
    number_of_days = (end_date - start_date).to_i
    number_of_days.zero? ? 1 : number_of_days
  end

  def in_progress?
    (start_date..end_date).include?(Date.today)
  end
  
  def has_happened?
    Date.today > end_date
  end
  
  def current_day
    active_day = days.find_by(date: Date.today)
    active_day || days.first
  end

  def update_days!
    unused_days = days.where.not(date: start_date..end_date)
    unused_days.destroy_all

    (start_date..end_date).each do |date|
      self.days.find_or_create_by!(date: date)
    end
  end
  
  def update!(params)
    super
    
    update_days! if params.has_key?(:start_date) || params.has_key?(:end_date)
  end
end
