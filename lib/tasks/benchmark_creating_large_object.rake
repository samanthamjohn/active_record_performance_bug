desc "Benchmark objects with and without serialize"
task benchmark_serialize: :environment do
  num_fields = 1000
  num_times = 10
  realtime = Benchmark.realtime do
    num_times.times do
      MyObject.create_object_with_large_unserialized_hash(num_fields) 
    end
  end
  puts "Average time to create object with unserialized hash of 1,000 keys: #{realtime/num_times.to_f}"

  realtime = Benchmark.realtime do
    num_times.times do
      MyObject.create_object_with_large_serialized_hash(num_fields) 
    end
  end

  puts "Average time to create object with serialized hash of 1,000 keys: #{realtime/num_times.to_f}"
end
