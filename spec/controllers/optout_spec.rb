require 'spec_helpers/boot'

describe OptoutController do
  it 'should not have protector subject' do
    OptoutController.effective_protector_subject.should == false
  end

  it 'do not restricts resources' do
    get :show, :id => 1
    assigns(:optout).protector_subject?.should be_false
  end
end

