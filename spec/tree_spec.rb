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
	value = 1
	before(:each) do
		@headNode = ListNode.new(value)
	end
	describe "initialization" do
		#let(:headNode){described_class.new(1)}
		it "instance of #{described_class}, @val = #{value} @nextN = nil" do
			expect(@headNode).to be_an_instance_of(ListNode)
			expect(@headNode.val).to eq(value)
			expect(@headNode.nextN).to eq(nil)
		end
	end
	describe "insertion" do
		it "inserts second and next elements" do
			expect{insert(@headNode,2)}.to change{@headNode.nextN}.from(nil).to(described_class)
			expect(@headNode.nextN.val).to eq(2)
			expect{insert(@headNode,3)}.to change{@headNode.nextN.nextN}.from(nil).to(described_class)
			expect(@headNode.nextN.nextN.val).to eq(3)
			insert(@headNode,4)
			expect(@headNode.nextN.nextN.nextN.val).to eq(4)
		end
	end
		
end