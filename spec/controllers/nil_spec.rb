require 'spec_helpers/boot'

describe NilController do
  it 'should have user-specified protector subject' do
    NilController.effective_protector_subject.should == :nil_current_user
  end

  it 'assigns proper (nil) user' do
    get :show, :id => 1
    assigns(:nil).protector_subject?.should be_true
    assigns(:nil).protector_subject.should == nil
  end
end
