# coding: utf-8
%w{httpi multi_json multi_xml open-uri rainbow}.map { |lib| require lib }

module Oversetter
	class Glosbe
		# Fetches examples from Glosbe.
		class Example
			# @param search [String] The word or phrase to search for.
      # @param params [Hash] The search parameters to use.
			def get_ex(search, params)
				func, result = 'tm', nil
				tran = Oversetter::Glosbe.new
				result = tran.get_word(search, func, params, result)
				result = MultiJson.load(result)
				if result != nil && result['result'] == 'ok'
					st = { 'searchterm' => URI.decode(search) }
					type = { 'type' => 'example' }
					Oversetter.tofile(st)
					Oversetter.tofile(type)
					ex = result['examples']
					x, y, label = 0, ex.length - 1, 'Examples'
					Oversetter.label(label)
					while x <= y
						item = ex[x]
						s = { 'source' => item['first'] }
						t = { 'target' => item['second'] }
						puts Rainbow("Source|#{item['first']}|Target|#{item['second']}").bright
						Oversetter.tofile(s)
						Oversetter.tofile(t)
						x += 1
					end
				end
			end
		end
	end
end
