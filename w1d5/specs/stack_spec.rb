require_relative 'stack'

describe Stack do
  subject(:stack) { Stack.new }

  describe "#initialize" do
    describe "starts the stack empty" do
      expect(Stack.show.empty?).to eq(true)
    end
  end
end
