require 'support/shared_examples_for_describables'
require 'support/shared_examples_for_governables'
require 'support/shared_examples_for_access_controllables'
require 'support/shared_examples_for_has_preservation_events'

shared_examples "a DulHydra object" do
  it_behaves_like "a describable object"
  it_behaves_like "a governable object"
  it_behaves_like "an access controllable object"
  it_behaves_like "an object that has preservation events"
end