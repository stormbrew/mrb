require File.expand_path('../../../spec_helper', __FILE__)
require File.expand_path('../fixtures/classes', __FILE__)

describe "Kernel#public_methods" do
  ruby_version_is ""..."1.9" do
    it "returns a list of the names of publicly accessible methods in the object" do
      KernelSpecs::Methods.public_methods(false).sort.should include("allocate", "hachi",
        "ichi", "juu", "juu_ni", "new", "roku", "san", "shi", "superclass")
      KernelSpecs::Methods.new.public_methods(false).sort.should include("juu_san", "ni")
    end
    
    it "returns a list of the names of publicly accessible methods in the object and its ancestors and mixed-in modules" do
      (KernelSpecs::Methods.public_methods(false) & KernelSpecs::Methods.public_methods).sort.should include(
        "allocate", "hachi", "ichi", "juu", "juu_ni", "new", "roku", "san", "shi", "superclass")
      m = KernelSpecs::Methods.new.public_methods
      m.should include('ni', 'juu_san')
    end

    it "returns public methods mixed in to the metaclass" do
      m = KernelSpecs::Methods.new
      m.extend(KernelSpecs::Methods::MetaclassMethods)
      m.public_methods.should include('peekaboo')
    end
  end

  ruby_version_is "1.9" do
    it "returns a list of the names of publicly accessible methods in the object" do
      KernelSpecs::Methods.public_methods(false).sort.should include(:hachi,
        :ichi, :juu, :juu_ni, :roku, :san, :shi)
      KernelSpecs::Methods.new.public_methods(false).sort.should include(:juu_san, :ni)
    end
    
    it "returns a list of the names of publicly accessible methods in the object and its ancestors and mixed-in modules" do
      (KernelSpecs::Methods.public_methods(false) & KernelSpecs::Methods.public_methods).sort.should include(
        :hachi, :ichi, :juu, :juu_ni, :roku, :san, :shi)
      m = KernelSpecs::Methods.new.public_methods
      m.should include(:ni, :juu_san)
    end

    it "returns methods mixed in to the metaclass" do
      m = KernelSpecs::Methods.new
      m.extend(KernelSpecs::Methods::MetaclassMethods)
      m.public_methods.should include(:peekaboo)
    end
  end
end
