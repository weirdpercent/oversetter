# coding: utf-8
%w{httpi multi_json multi_xml open-uri rainbow}.map { |lib| require lib }

module Oversetter
	class Hablaa
		# Fetches examples from Hablaa.
		class Example
			# @param search [String] The word or phrase to search for.
      # @param params [Hash] The search parameters to use.
			def get_ex(search, params)
				func, result = 'translations-examples', nil
				tran = Oversetter::Hablaa.new
				result = tran.get_word(search, func, params, result)
				result = MultiJson.load(result) #array of hashes
				label = 'Examples'
				Oversetter.label(label)
				st = { 'searchterm' => URI.decode(search) }
				type = { 'type' => 'example' }
				Oversetter.tofile(st)
				Oversetter.tofile(type)
				x, y = 0, result.length - 1
				while x <= y
					item = result[x]
					source = item['src']
					dest = item['dst']
					s = { 'source' => source }
					d = { 'destination' => dest }
					#Oversetter.tofile(s)
					#Oversetter.tofile(d)
					print Rainbow('Source|').bright
					print "#{source}|"
					print Rainbow('Destination|').bright
					print "#{dest}|"
					puts ''
					x += 1
				end
			end
		end
	end
end
