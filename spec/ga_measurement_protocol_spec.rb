require 'spec_helper'

describe GaMeasurementProtocol do
  it 'has a version number' do
    expect(GaMeasurementProtocol::VERSION).not_to be nil
  end

  describe 'Client' do
    describe 'get'

    describe '#post' do
      subject { client.post(request) }

      let(:client) { GaMeasurementProtocol::Client.new }
      let(:request) do
        {
          tid: 'tid',
          v: 'v'
        }
      end

      it { is_expected.to be_a Hash }
    end
  end
end
