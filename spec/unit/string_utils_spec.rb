require 'spec_helper'
require 'rainbow/string_utils'

module Rainbow
  describe StringUtils do
    describe '.wrap_with_sgr' do

      subject { described_class.wrap_with_sgr(string, codes) }

      let(:string) { 'hello' }

      context "when no codes given" do
        let(:codes) { [] }

        it "doesn't wrap the given string with any sgr sequence" do
          expect(subject).to eq("hello")
        end
      end

      context "when single code given" do
        let(:codes) { [1] }

        it "wraps the given string with sgr sequence for given codes" do
          expect(subject).to eq("\e[1mhello\e[0m")
        end
      end

      context "when multiple codes given" do
        let(:codes) { [1, 2] }

        it "wraps the given string with sgr sequence for given codes" do
          expect(subject).to eq("\e[1;2mhello\e[0m")
        end
      end

      context "when wrapping an already wrapped string" do
        let(:string) { "\e[1;2mhello\e[0m" }
        let(:codes) { [3, 4] }

        it "wraps the given string with sgr sequence for given codes" do
          expect(subject).to eq("\e[1;2m\e[3;4mhello\e[0m")
        end
      end

    end
  end
end
