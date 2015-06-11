# coding: utf-8
%w{httpi multi_json multi_xml rainbow}.map { |lib| require lib }

module Oversetter
	class Yandex
		# Lists supported translation 'directions,' pairs of source and target languages.
		class Getlangs
			# @param search [String] The word or phrase for which to detect the language.
			# @param params [Hash] The search parameters to use.
			def get_lang(search, params)
				func, result = 'getLangs', nil
				lang = Oversetter::Yandex.new
				result = lang.get_word(search, func, params, result)
				result = MultiJson.load(result)
				dirs = result['dirs']
				if result['langs'] != nil
					langs = result['langs']
				end
				x, y, label = 0, dirs.length - 1, 'Translation directions'
				Oversetter.label(label)
				while x <= y
					print "#{dirs[x]}"
					print ', '
					x += 1
				end
				puts ''
				if langs != nil
					label = 'Language names'
					Oversetter.label(label)
					langs.map { |k,v|
						print "#{k} -> #{v}"
						print ', '
					}
					puts ''
				end
			end
		end
	end
end
