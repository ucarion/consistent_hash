require 'spec_helper'

describe String do
  it 'creates a String#consistent_hash method' do
    expect("").to respond_to(:consistent_hash)
  end

  it 'works just like Java String#hashCode' do
    examples = {
      "" => 0,
      "hello world" => 1794106052,
      "this is a test" => -1879005787,
      "a" * 200 => 469437568
    }

    examples.each { |k, v| expect(k.consistent_hash).to eq v }
  end
end
