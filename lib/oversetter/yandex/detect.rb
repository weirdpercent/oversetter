# coding: utf-8
%w{httpi multi_json multi_xml rainbow}.map { |lib| require lib }

module Oversetter
	class Yandex
		# Detects the language for a given word or phrase.
		class Detect
			# @param search [String] The word or phrase for which to detect the language.
			# @param params [Hash] The search parameters to use.
			def detect(search, params)
				func, result = 'detect', nil
				det = Oversetter::Yandex.new
				result = det.get_word(search, func, params, result)
				result = MultiJson.load(result)
				if result != nil && result['code'] == 200
					lang = result['lang']
					label = 'Detect language'
					Oversetter.label(label)
					puts "#{lang}"
				else
					puts "Yandex returned an empty string."
				end
			end
		end
	end
end
