# Unit tests for genetic_programming.rb

# The Clever Algorithms Project: http://www.CleverAlgorithms.com
# (c) Copyright 2010 Jason Brownlee. Some Rights Reserved. 
# This work is licensed under a Creative Commons Attribution-Noncommercial-Share Alike 2.5 Australia License.

require "test/unit"
require File.expand_path(File.dirname(__FILE__)) + "/../genetic_programming"

class TC_GeneticProgramming < Test::Unit::TestCase 
  
  # TODO write tests
  
  
  # helper for turning off STDOUT
  # File activesupport/lib/active_support/core_ext/kernel/reporting.rb, line 39
  def silence_stream(stream)
    old_stream = stream.dup
    stream.reopen('/dev/null')
    stream.sync = true
    yield
  ensure
    stream.reopen(old_stream)
  end   
  
  # test that the algorithm can solve the problem
  def test_search    
    terminals = ['X', 'R']
    functions = [:+, :-, :*, :/]  
    best = nil
    silence_stream(STDOUT) do
      best = search(50, 50, 6, 3, 0.08, 0.9, 0.02, functions, terminals)
    end  
    assert_in_delta(0.0, best[:fitness], 0.5)
  end
  
end