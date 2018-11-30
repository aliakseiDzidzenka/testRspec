require 'test_data'

RSpec.describe ListNode do 	

	value = reset_value
	head_node = reset_head_node(value)
	in_node = reset_in_node

	describe "#initialize" do
		context "with right parameters" do
			it "instance of #{described_class}" do
				expect(head_node).to be_an_instance_of(described_class)
			end
			it "val = #{value}" do
				expect(head_node.val).to eq(value)
			end
			it "next_n = nil" do
				expect(head_node.next_n).to eq(nil)
			end
		end
		context "with wrong parameters" do
			it "raise error if no parameters" do
				expect{described_class.new}.to raise_error(ArgumentError)
			end
			it "raise error if > 1 parameters" do
				expect{described_class.new(1, 1)}.to raise_error(ArgumentError)
			end
		end
	end

	describe ".insert" do
		context "with rigth parameters" do
			it "inserts second and next nodes" do
				head_node = reset_head_node(value)
				expect{insert(head_node,2)}.to change{head_node.next_n}.from(nil).to(described_class)
				expect(head_node.next_n.val).to eq(2)
				expect{insert(head_node,3)}.to change{head_node.next_n.next_n}.from(nil).to(described_class)
				expect(head_node.next_n.next_n.val).to eq(3)
				insert(head_node,4)
				expect(head_node.next_n.next_n.next_n.val).to eq(4)
			end
			it "insert to the end" do
				in_node = reset_in_node
				expect{insert(in_node.next_n,5)}.to change{in_node.next_n.next_n.next_n.next_n}.from(nil).to(described_class)
			end
		end
	end
	describe ".reverse_list" do
		context "with right arguments" do
			it "returns #{described_class}" do
				expect(reverse_list(in_node)).to be_an_instance_of(described_class)
			end
			it "dosn't changes val, but truly reverse list" do
				in_node = reset_in_node
				class << in_node.next_n
					def check_method
						true
					end
				end
				in_node = reverse_list(in_node)
				expect(in_node.next_n.next_n.check_method).to eq(true)
			end
		end
		context "with wrong arguments" do
			it "raise error if not #{described_class}" do
				expect{reverse_list 1}.to raise_error(ArgumentError)
			end
			it "raise error if no parameters" do
				expect{reverse_list}.to raise_error(ArgumentError)
			end
			it "raise error if > 1 parameters" do
				expect{reverse_list(in_node, in_node)}.to raise_error(ArgumentError)
			end
		end
	end

	describe ".show" do
		context "with right arguments count" do
			it "returns a string if #{described_class} given" do
				in_node = reset_in_node
				expect(show(in_node)).to be_an_instance_of(String)
			end
			it "returns a string if any argument given" do
				expect(show(value)).to be_an_instance_of(String)
			end
		end
		context "with wrong arguments count" do
			it "raise error if no parameters" do
				expect{show}.to raise_error(ArgumentError)
			end
			it "raise error if > 1 parameters" do
				expect{show(in_node, in_node)}.to raise_error(ArgumentError)
			end
		end
	end
end
