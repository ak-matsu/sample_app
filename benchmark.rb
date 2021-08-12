require 'benchmark/ips'

Benchmark.ips do |x|
  x.report("addition") { 1 + 2 }
  x.report("addition2") do |times|
    i = 0
    while i < times
      1 + 2
      i += 1
    end
  end
  x.report("addition3", "1 + 2")
  x.report("addition-test-long-label") { 1 + 2 }

  x.compare!
end