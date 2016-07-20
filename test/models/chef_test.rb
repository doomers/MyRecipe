require 'test_helper'

class ChefTest < ActiveSupport::TestCase
      def setup
       @chef= Chef.create(name: "chef Austin", email: "austin76@gmail.com")
      end

     test "chef should be valid" do
     	
     end

	end