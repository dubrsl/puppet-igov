require 'spec_helper'
describe 'npm' do

  context 'with defaults for all parameters' do
    it { should contain_class('npm') }
  end
end
