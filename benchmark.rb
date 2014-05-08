require 'benchmark'

def random_string
  length = rand(10000).to_i
  length.times.map { (('a'..'z').to_a + ('A'..'Z').to_a).sample }.join
end

strings = 1000.times.map { random_string }

def naive_hash(s)
  s.chars.reduce(0) { |acc, char| acc * 31 + char.ord }
end

def ruby_hash(s)
  h = 0
  i = 0
  while i < s.bytesize
    h = h * 31 + s.getbyte(i)
    i += 1
  end
  h
end

require 'consistent_hash'

Benchmark.bm(10) do |x|
  x.report("naive:")    { strings.each { |s| naive_hash(s) } }
  x.report("ruby:")     { strings.each { |s| ruby_hash(s) } }
  x.report("c:")        { strings.each { |s| s.consistent_hash } }
  x.report("std hash:") { strings.each { |s| s.hash } }
end
