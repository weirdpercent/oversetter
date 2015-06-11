# coding: utf-8
%w{httpi multi_json multi_xml open-uri rainbow}.map { |lib| require lib }

module Oversetter
	class Yandex
		# Fetches translations from Yandex.
		class Translate
			# @param search [String] The word or phrase to search for.
			# @param params [Hash] The search parameters to use.
			def get_trans(search, params)
				func, result = 'translate', nil
				tran = Oversetter::Yandex.new
				result = tran.get_word(search, func, params, result)
				result = MultiJson.load(result)
				if result != nil
					st = { 'searchterm' => URI.decode(search) }
					type = { 'type' => 'translation' }
					Oversetter.tofile(st)
					Oversetter.tofile(type)
					label = 'Translation'
					if result['code'] == 200
						detected = result['detected']
						lang = result['lang']
						text = result['text']
						Oversetter.label(label)
						if detected != nil
							detected = detected['lang']
							print Rainbow("Detected: #{detected}|").bright
						end
						dir = { 'direction' => lang }
						out = { 'translation' => text }
						Oversetter.tofile(dir)
						Oversetter.tofile(out)
						print Rainbow("Language direction: #{lang}|").bright
						puts "Result: #{text[0]}"
					end
				else
					puts 'Yandex returned an empty string.'
				end
			end
		end
	end
end
