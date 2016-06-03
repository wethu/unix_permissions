require "spec_helper"
require_relative "../../lib/permissions"
RSpec.describe Permissions do

  subject { described_class }

  context "when it receives valid data" do
    it "converts rwxr-x-w- to 752" do
      expect(subject.string_to_int("rwxr-x-w-")).to eq "752"
    end

    it "converts ---rwxrwx to '077'" do
      expect(subject.string_to_int("---rwxrwx")).to eq "077"
    end

    it "converts rw-rw-r-- to 664" do
      expect(subject.string_to_int("rw-rw-r--")).to eq "664"
    end
  end
end
