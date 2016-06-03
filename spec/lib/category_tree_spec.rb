require "spec_helper"
require_relative "../../lib/category_tree"

RSpec.describe CategoryTree do
  subject { described_class.new }

  it "adds multiple categories" do
    subject.add_category("A", nil)
    subject.add_category("B", "A")
    subject.add_category("C", "A")
    expect(subject.get_children('A').join(',')).to eq "B,C"
  end

  it "raises ArgumentError when category is already taken" do
    expect {
      subject.add_category("A", "B")
      subject.add_category("A", "C")
    }.to raise_error ArgumentError
  end
end
