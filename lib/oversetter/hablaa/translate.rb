# coding: utf-8
%w{httpi multi_json multi_xml open-uri rainbow}.map { |lib| require lib }

module Oversetter
	class Hablaa
		# Fetches translations from Hablaa.
		class Translate
			# @param search [String] The word or phrase to search for.
      # @param params [Hash] The search parameters to use.
			def get_trans(search, params)
				func, result = 'translation', nil
				tran = Oversetter::Hablaa.new
				result = tran.get_word(search, func, params, result)
				if result != 'error'
					result = MultiJson.load(result)
					result = result[0]
					st = { 'searchterm' => URI.decode(search) }
					type = { 'type' => 'translation' }
					Oversetter.tofile(st)
					Oversetter.tofile(type)
					label = 'Translation'
					Oversetter.label(label)
					text = result['text']
					source = result['source']
					pos = result['pos']
					print Rainbow('Text|').bright
					print "#{text}|"
					print Rainbow('Source|').bright
					print "#{source}|"
					t = { 'text' => text }
					s = { 'source' => source }
					Oversetter.tofile(t)
					Oversetter.tofile(s)
					if pos['code'] != nil
						print Rainbow('POS code|').bright
						print "#{pos['code']}|"
						pc = { 'pos code' => pos['code'] }
						Oversetter.tofile(pc)
					end
					if pos['title'] != nil
						print Rainbow('Part of speech|').bright
						print "#{pos['title']}|"
						pt = { 'pos title' => pos['title']}
						Oversetter.tofile(pt)
					end
					puts ''
				else
					puts 'Hablaa found no results.'
				end
			end
		end
	end
end
