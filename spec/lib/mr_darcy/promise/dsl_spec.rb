require 'spec_helper'

describe MrDarcy::Promise::DSL do

  let(:promise) { double :promise }
  let(:dsl)     { described_class.new(promise) }
  subject       { dsl }

  it { should respond_to :resolve }
  it { should respond_to :reject }
  it { should respond_to :unresolved? }
  it { should respond_to :resolved? }
  it { should respond_to :rejected? }
  it { should respond_to :then }
  it { should respond_to :fail }
  it { should respond_to :result }
  it { should respond_to :final }

  describe '#resolve' do
    subject { dsl.resolve :resolved_value }
    before  { promise.stub :value= => nil, resolve: nil }

    it 'resolves the promise' do
      promise.should_receive(:resolve).with(:resolved_value)
      subject
    end
  end

  describe '#reject' do
    subject { dsl.reject :exception }
    before  { promise.stub :value= => nil, reject: nil }

    it 'rejects the promise' do
      promise.should_receive(:reject).with(:exception)
      subject
    end
  end

end
