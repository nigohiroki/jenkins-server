require 'spec_helper'

describe command('phantomjs --version') do
  it { should return_stdout '1.9.7' }
end
