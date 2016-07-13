class Upload
  include Mongoid::Document
  include Mongoid::Timestamps

  field :file_type, type: String
  field :program, type: String
  field :year, type: String
  field :correlation_id, type: String
  field :state, type: Symbol, default: :pending
  field :status_message, type: String

  has_one :artifact, :autosave => true, :dependent => :destroy
  has_many :qrda_files, :dependent => :destroy, validate: false

  def can_calculate
    %w(cat1_r2 cat1_r3 cat1_r31).include?(file_type)
  end

  def completed?
    state == :complete || state == :failed
  end

  def complete(message = '')
    self.state = :complete
    self.status_message = message
    save!(validate: false)
  end

  def fail(message = '')
    self.state = :failed
    self.status_message = message
    save!(validate: false)
  end
end