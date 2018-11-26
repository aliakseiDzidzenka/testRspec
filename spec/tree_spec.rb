require "rev"

RSpec.describe ListNode do 	
	#let(:headNode) {described_class.new(1)}

	# describe "initialization" do
	# 	it "is instance of #{described_class}, has passed value in @val and 'nil' value in nextN" do
	# 		expect(headNode).to be_an_instance_of(ListNode)
	# 		expect(headNode.val).to eq(1)
	# 		expect(headNode.nextN).to eq(nil)
	# 	end
	# end


	#let(:headNode) {described_class.new(1)}
	# describe "insertion" do
	# 	it "inserts a new value" do
	# 		expect{insert(headNode,2)}.to change{headNode.nextN}.from(nil).to(ListNode)
	# 		expect(headNode.nextN.val).to eq(2)
	# 	end
	# end
	before(:each) do
		@headNode = ListNode.new(1)
	end
	describe "initialization" do
		it "instance of #{described_class}, @val = value @nextN = nil" do
			expect(@headNode).to be_an_instance_of(ListNode)
			expect(@headNode.val).to eq(1)
			expect(@headNode.nextN).to eq(nil)
		end
		it "inserts a new value" do
			expect{insert(@headNode,2)}.to change{@headNode.nextN}.from(nil).to(described_class)
			expect(@headNode.nextN.val).to eq(2)
		end
	end
		
end