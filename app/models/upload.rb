# frozen_string_literal: true
class Upload
  include Mongoid::Document
  include Mongoid::Timestamps

  field :file_type, type: String
  field :program, type: String
  field :year, type: String
  field :file_count, type: Integer
  field :state, :type => Symbol, :default => :uploaded
  field :status_message, type: String

  has_one :artifact, :autosave => true, :dependent => :destroy
  has_many :qrda_files, :dependent => :destroy, :validate => false

  def can_calculate
    %w(cat1_r2 cat1_r3 cat1_r31 cat1_r4).include?(file_type)
  end

  def fail(message = '', qrda_file = nil)
    self.state = :failed
    message = message.to_s + " for file '#{qrda_file.filename}'" if qrda_file
    self.status_message = message
    save!(validate: false)
  end
end
