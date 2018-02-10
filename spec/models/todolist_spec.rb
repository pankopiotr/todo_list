require 'rails_helper'

RSpec.describe Todolist, type: :model do
  subject { Todolist.new }

  it { is_expected.to have_many(:tasks) }

  it { is_expected.to validate_presence_of(:name) }
end