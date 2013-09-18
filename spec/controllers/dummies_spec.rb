require 'spec_helpers/boot'

describe DummiesController do
  it 'should have default protector subject' do
    DummiesController.effective_protector_subject.should == :current_user
  end

  it 'restricts collections' do
    get :index
    first_dummy = assigns(:dummies).first!
    first_dummy.protector_subject?.should be_true
    first_dummy.protector_subject.should == 'default_user'
  end

  it 'restricts resources' do
    get :show, :id => 1
    assigns(:dummy).protector_subject?.should be_true
    assigns(:dummy).protector_subject.should == 'default_user'
  end

  it 'restricts newly created resources' do
    get :new
    assigns(:dummy).protector_subject?.should be_true
    assigns(:dummy).protector_subject.should == 'default_user'
  end
end
