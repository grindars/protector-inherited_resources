require 'spec_helpers/boot'

describe DerivedController do
  it 'should inherit user-specified protector subject' do
    DerivedController.effective_protector_subject.should == :custom_current_user
  end

  it 'assigns proper user' do
    get :show, :id => 1
    assigns(:derived).protector_subject?.should be_true
    assigns(:derived).protector_subject.should == 'custom_user'
  end
end
