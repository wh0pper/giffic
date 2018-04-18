require 'rails_helper'

describe Node do
  it { should validate_presence_of :sentence }
end