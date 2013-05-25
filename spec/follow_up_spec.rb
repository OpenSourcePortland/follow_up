# encoding: utf-8
require 'spec_helper'
describe FollowUp do
  
  describe "initial setup" do
    "it should create a table called FollowUps" do
      expect{Follow}
    end
  end
  
  describe "before sending emails" do
    it "should properly include scoped users to email" do
      pending
    end
    
    it "should not include scoped users that have already been emailed max times" do
      pending
    end
    
  end

  
  
  describe "after sending emails" do
    
    it "should update conversion attempts for user" do
      pending
    end
    
    
  end
  
  
end