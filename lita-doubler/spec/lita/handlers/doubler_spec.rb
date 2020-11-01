require "spec_helper"

describe Lita::Handlers::Doubler, lita_handler: true do
    let(:robot) {lita::Robot.new(registry)}

    subject {  described_class.new(robot) } 

    describe 'routing' do
        it {is_expected.to route('Lita double 2')}
        it {is_expected.to route('Lita double     22')}

        it {is_expected.to route('Lita double 4')}
        it {is_expected.to route('Lita double two')}
        it {is_expected.to route('Lita double le4')}

    end

    describe 'functionality' do
        describe ':double_number' do
            actual = subject.double_number n
            expected = n * 2

            expect(actual).to ex(expected)
        end
    end

    it 'doubles number when asked to' do
        send_message 'Lita double 2'
        expect(replies.last).to eq('2 + 2 = 4')
    end
end
end
