#encoding: utf-8
require "spec_helper"

class Foo
  include Mongoid::Document
  include Mongoid::Ordered
  
  ordered_on :pos
end

module Mongoid
  describe Ordered do
    subject { Foo.new pos: 1 }
    it { should respond_to :<=> }
    it { should respond_to :< }
    it { should respond_to :pos }
    it { should respond_to :swap_with }

    describe '#swap_with' do
      it "swaps its position with another object" do
        d1 = Foo.new pos: 1
        d2 = Foo.new pos: 3
        d1.swap_with(d2)
        d1.pos.should == 3
        d2.pos.should == 1
      end
    end

    it "compares the positions" do
      d2 = Foo.new pos: 2
      subject.pos.should < d2.pos
      x = subject < d2
      x.should be_true
    end
    
        
	end
end
