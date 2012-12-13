require 'spec_helper'

describe AdminPolicy do
  it "should raise an exception when calling default and default APO has not been created" do
    lambda { AdminPolicy.get_default_apo }.should raise_error(ActiveFedora::ObjectNotFoundError)
  end
  context "#create_default_apo!" do
    before do
      AdminPolicy.create_default_apo!
    end
    after do
      AdminPolicy.get_default_apo.delete
    end
    it "should have a default admin policy object" do
      AdminPolicy.get_default_apo.should be_kind_of(AdminPolicy)
    end
  end
end