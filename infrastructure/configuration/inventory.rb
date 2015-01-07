require 'json'
require 'erb'

stacks = JSON.parse(STDIN.read)
outputs = Hash.new

stacks["Stacks"][0]["Outputs"].each do |output|
	outputs[output["OutputKey"]] = output["OutputValue"]
end

inventory = ERB.new(File.read('inventory.erb'))
puts inventory.result(binding)
