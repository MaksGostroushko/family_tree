require 'rails_helper'

# describe "relative routes" do
describe RelativesController do
  it { is_expected.to route(:get, '/relatives/1').to(action: :show, id: 1) }
end
