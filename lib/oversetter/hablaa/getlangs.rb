# coding: utf-8
%w{httpi multi_json multi_xml rainbow}.map { |lib| require lib }

module Oversetter
	class Hablaa
		# Fetches supported languages from Hablaa.
		class Getlangs
			# @param search [String] The word or phrase to search for.
      # @param params [Hash] The search parameters to use.
			def get_lang(search, params)
				func, result = 'languages', nil
				lang = Oversetter::Hablaa.new
				result = lang.get_word(search, func, params, result)
				result = MultiJson.load(result) #array of hashes
				label = 'Languages'
				Oversetter.label(label)
				puts ''
				x, y = 0, result.length - 1
				while x <= y
					item = result[x]
					print Rainbow('Name|').bright
					print "#{item['name']}|"
					print Rainbow('Code|').bright
					print "#{item['lang_code']}|"
					print Rainbow('Site Language?|').bright
					if item['site_language'] == '1' then print 'yes' else print 'no'; end
					puts ''
					x += 1
				end
			end
		end
	end
end
