# coding: utf-8
%w{httpi multi_json multi_xml open-uri rainbow}.map { |lib| require lib }

module Oversetter
	class Hablaa
		# Fetches similar translations from Hablaa.
		class Similar
			# @param search [String] The word or phrase to search for.
      # @param params [Hash] The search parameters to use.
			def get_sim(search, params)
				func, result = 'translations-similar', nil
				tran = Oversetter::Hablaa.new
				result = tran.get_word(search, func, params, result)
				result = MultiJson.load(result) #array of hashes
				st = { 'searchterm' => URI.decode(search) }
				type = { 'type' => 'similar' }
				Oversetter.tofile(st)
				Oversetter.tofile(type)
				label = 'Similar'
				Oversetter.label(label)
				x, y = 0, result.length - 1
				while x <= y
					item = result[x]
					source = item['src']
					dest = item['dst']
					print Rainbow('Source|').bright
					print "#{source['text']}|"
					print Rainbow('Destination|').bright
					puts "#{dest['text']}|"
					s = { 'source' => source['text'] }
					d = { 'destination' => dest['text'] }
					Oversetter.tofile(s)
					Oversetter.tofile(d)
					x += 1
				end
			end
		end
	end
end
