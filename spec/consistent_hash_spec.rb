require 'spec_helper'

describe String do
  it 'creates a String#consistent_hash method' do
    expect("").to respond_to(:consistent_hash)
  end
end
