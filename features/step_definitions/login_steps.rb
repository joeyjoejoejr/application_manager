Given /^the following (.+) records$/ do |factory, table|
	table.hashes.each do |hash|
		Factory.create(factory, hash)
	end
end