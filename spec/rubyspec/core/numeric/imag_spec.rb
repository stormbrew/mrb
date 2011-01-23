require File.expand_path('../../../spec_helper', __FILE__)
require File.expand_path('../../../shared/complex/numeric/imag', __FILE__)

ruby_version_is "1.9" do
  describe "Numeric#imag" do
    it_behaves_like(:numeric_imag, :imag)
  end
end
