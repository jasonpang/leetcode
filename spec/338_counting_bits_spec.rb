require_relative '../338_counting_bits'

describe 'perfect_square_of' do
	it 'test' do
		expect(perfect_square_of?(1, 2)).to be_truthy
		expect(perfect_square_of?(2, 2)).to be_truthy
		expect(perfect_square_of?(3, 2)).to be_falsey
		expect(perfect_square_of?(4, 2)).to be_truthy
		expect(perfect_square_of?(5, 2)).to be_falsey
		expect(perfect_square_of?(6, 2)).to be_falsey
		expect(perfect_square_of?(7, 2)).to be_falsey
		expect(perfect_square_of?(8, 2)).to be_truthy
		expect(perfect_square_of?(9, 2)).to be_falsey
	end
end

describe 'count_bits' do
	it 'test' do
		#expect(count_bits(5)).to eq([0, 1, 1, 2, 1, 2])
		#expect(count_bits(11)).to eq([0, 1, 1, 2, 1, 2, 2, 3, 1, 2, 2, 3])
		expect(count_bits(85723))
	end
end