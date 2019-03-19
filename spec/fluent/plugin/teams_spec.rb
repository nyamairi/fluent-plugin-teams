RSpec.describe Fluent::Plugin::TeamsOutput do
  before do
    Fluent::Test.setup
  end

  let(:driver) do
    Fluent::Test::Driver::Output.new(Fluent::Plugin::TeamsOutput).configure(config)
  end

  let(:instance) { driver.instance }

  let(:config) do
    %(
      webhook_url http://example.com
      text        "hoge fuga"
    )
  end

  describe 'config' do
    it 'should get webhook_url' do
      expect(instance.webhook_url).to eq 'http://example.com'
    end

    it 'should get text' do
      expect(instance.text).to eq 'hoge fuga'
    end
  end

  describe '#build_payload' do
    subject do
      instance.build_payload(tag: tag, time: time, record: record)
    end

    let(:tag) { "test.hoge" }
    let(:time) { Time.now }
    let(:record) { {} }

    context 'When contain erb format' do
      let(:config) do
        %(
          webhook_url http://example.jp/
          text        "Hello <%= record['user'] %>!"
        )
      end

      let(:record) { { 'user' => 'nyamairi' } }

      it { expect(subject[:text]).to eq 'Hello nyamairi!' }
    end

    context 'When contain newline character' do
      let(:config) do
        %(
          webhook_url http://example.jp/
          text        "first line\\nsecond line."
        )
      end

      it { expect(subject[:text]).to eq "first line\nsecond line." }
    end
  end
end
