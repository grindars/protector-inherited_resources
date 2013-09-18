require 'spec_helpers/boot'

describe CustomUserController do
  it 'should have user-specified protector subject' do
    CustomUserController.effective_protector_subject.should == :custom_current_user
  end

  it 'assigns proper user' do
    get :show, :id => 1
    assigns(:custom_user).protector_subject?.should be_true
    assigns(:custom_user).protector_subject.should == 'custom_user'
  end
end
