require_relative '../stack'

# run with bundle exec rspec specs/file

describe Stack do
  subject(:stack) { Stack.new }

  describe "#initialize" do
    describe "starts the stack empty" do
      expect(stack.show.empty?).to eq(true)
    end
  end
end
