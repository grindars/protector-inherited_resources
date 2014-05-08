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

  it 'implements create' do
    post :create, dummy: { value: 'foo' }
    assigns(:dummy).protector_subject?.should be_true
    assigns(:dummy).protector_subject.should == 'default_user'
    assigns(:dummy).persisted?.should be_true
    assigns(:dummy).value.should == 'foo'
  end

  it 'implements update' do
    Dummy.find(1).update_attributes value: 'before_update'

    post :update, id: 1, dummy: { value: 'after_update' }
    assigns(:dummy).protector_subject?.should be_true
    assigns(:dummy).protector_subject.should == 'default_user'

    Dummy.find(1).value.should == 'after_update'
  end

  it 'implements destroy' do
    dummy = Dummy.create!
    post :destroy, id: dummy.id
    assigns(:dummy).protector_subject?.should be_true
    assigns(:dummy).protector_subject.should == 'default_user'
    expect { dummy.reload }.to raise_error(ActiveRecord::RecordNotFound)
  end
end
