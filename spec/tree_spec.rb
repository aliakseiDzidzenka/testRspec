require "rev"

RSpec.describe ListNode do 	
	value = 1
	before(:each) do
		@headNode = ListNode.new(value)

		@inNode = ListNode.new(1)
		@inNode.nextN = ListNode.new(2)
		@inNode.nextN.nextN = ListNode.new(3)
		@inNode.nextN.nextN.nextN = ListNode.new(4)
	end
	describe "initialization" do
		context "rigth parameters" do
			it "instance of #{described_class}, @val = #{value} @nextN = nil" do
				expect(@headNode).to be_an_instance_of(described_class)
				expect(@headNode.val).to eq(value)
				expect(@headNode.nextN).to eq(nil)
			end
		end
		context "wrong parameters" do
			it "raise error if not 1 parameter" do
				expect{described_class.new}.to raise_error(ArgumentError)
				expect{described_class.new(1, 1)}.to raise_error(ArgumentError)
			end
		end
	end

	describe "insertion" do
		context "rigth parameters" do
			it "inserts second and next nodes" do
				expect{insert(@headNode,2)}.to change{@headNode.nextN}.from(nil).to(described_class)
				expect(@headNode.nextN.val).to eq(2)
				expect{insert(@headNode,3)}.to change{@headNode.nextN.nextN}.from(nil).to(described_class)
				expect(@headNode.nextN.nextN.val).to eq(3)
				insert(@headNode,4)
				expect(@headNode.nextN.nextN.nextN.val).to eq(4)
			end
			it "insert to the end" do
				expect{insert(@inNode.nextN,5)}.to change{@inNode.nextN.nextN.nextN.nextN}.from(nil).to(described_class)
			end
		end
	end
	describe "reverse" do
		context "list reversion" do
			it "returns #{described_class}" do
				expect(reverse_list(@inNode)).to be_an_instance_of(described_class)
			end
			it "dosn't changes val, but truly reverse list" do
				class << @inNode.nextN
					def check_method
						true
					end
				end
				expect{@inNode = reverse_list(@inNode)}.to change{@inNode.val}.to(4)
				expect(@inNode.nextN.nextN).to receive(:check_method).and_return(true)
				@inNode.nextN.nextN.check_method
			end
		end
		context "wrong arguments" do
			it "raise error if not #{described_class}" do
				expect{reverse_list 1}.to raise_error(ArgumentError)
			end
			it "raise error if not 1 parameter" do
				expect{reverse_list}.to raise_error(ArgumentError)
				expect{reverse_list(@inNode, @inNode)}.to raise_error(ArgumentError)
			end
		end
	end

	describe "show" do
		context "right arguments count" do
			it "returns a string" do
				expect(show(@inNode)).to be_an_instance_of(String)
				expect(show(value)).to be_an_instance_of(String)
			end
		end
		context "wrong arguments count" do
			it "raise error" do
				expect{show}.to raise_error(ArgumentError)
				expect{show(@inNode, @inNode)}.to raise_error(ArgumentError)
			end
		end
	end
end