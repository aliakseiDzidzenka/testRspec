require "rev"

RSpec.describe ListNode do 	
	let(:headNode) {described_class.new(1)}

	describe "initialization" do
		it "has passed value in @val and 'nil' value in nextN" do
			expect(headNode.val).to eq(1)
			expect(headNode.nextN).to eq(nil)
		end
	end
end