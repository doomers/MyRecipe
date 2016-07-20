require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

   def setup
   @recipe = Recipe.new(name: "randomrecipe", summary: "this is a dish of random place", 
   	description: "this is very famous in some random place in some random country..lol")
   end


   test "recipe should be valid" do
   	assert  @recipe.valid?
   end

   test "name shouldnt be null" do
    	@recipe.name = " "
      assert_not @recipe.valid?
   end

   test "name shouldnt be too long" do
       @recipe.name = "a"*101
       assert_not @recipe.valid?    
   end

   test "name shouldnt br too short" do
      @recipe.name = "aaaa"
      assert_not @recipe.valid?
   end

   test "summary should be present" do
      @recipe.summary = ""
      assert_not @recipe.valid?
   end

   test "summary shouldnt be too short" do
      @recipe.summary = "a"*9
      assert_not @recipe.valid?

   end

   test "summary shouldnt be too long"  do
      @recipe.summary = "a"*151
      assert_not @recipe.valid?
   
   end

   test "description shouldnt be too short" do
       @recipe.description = "a"*10
       assert_not @recipe.valid?

   end

   test "description shouldnt be too long" do
      @recipe.description = "a"*151
      assert_not @recipe.valid?

   end
end