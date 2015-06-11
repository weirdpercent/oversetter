# coding: utf-8
%w{htmlentities httpi multi_json multi_xml open-uri rainbow}.map { |lib| require lib }

module Oversetter
	class Glosbe
		# Fetches translations from Glosbe.
		class Translate
			# Main operations.
			#
			# @param search [String] The word or phrase to search for.
      # @param params [Hash] The search parameters to use.
			def get_trans(search, params)
				func, result = 'translate', nil
				tran = Oversetter::Glosbe.new
				result = tran.get_word(search, func, params, result)
				if result =~ /&quot;/i
					q = Oversetter::Glosbe::Translate.new
					q.quote(result)
				end
				if result =~ /&[a-z]*;/i
					ent = Oversetter::Glosbe::Translate.new
					ent.entities(result)
				end
				result = MultiJson.load(result)
				if result['result'] == 'ok'
					st = { 'searchterm' => URI.decode(search) }
					type = { 'type' => 'translation' }
					Oversetter.tofile(st)
					Oversetter.tofile(type)
					authors = result['authors']
					if params[:auth] == true
						a = Oversetter::Glosbe::Translate.new
						a.authors(authors)
					end
					label = 'Translation'
					Oversetter.label(label)
					tuc = result['tuc'] #array of hashes
					x, y = 0, tuc.length - 1
					while x <= y
						item = tuc[x]
						mean = item['meanings'] #array of hashes
						if mean != nil
							m = Oversetter::Glosbe::Translate.new
							m.mean(mean)
						end
						phrase = item['phrase'] #hash
						if phrase != nil
							p = Oversetter::Glosbe::Translate.new
							p.phrase(phrase)
						end
						x += 1
					end
				end
			end
			# Replaces &quot; HTML entity w/ character escapes for JSON.
			#
			# @param result [String] JSON string of search results.
			def quote(result)
				result = result.gsub('&quot;', "\\\"")
				return result
			end
			# Replaces HTML entities w/ UTF-8 characters.
			#
			# @param result [String] JSON string of search results.
			def entities(result)
				Encoding.default_external = "UTF-8"
				coder = HTMLEntities.new
				result = coder.decode(result.force_encoding('UTF-8'))
				return result
			end
			# Prints a list of translation authors.
			#
			# @param authors [Hash] List of author/URL pairs.
			def authors(authors)
				authors.map { |k,v|
					source = v
					puts Rainbow("Author|#{source['N']}|URL|#{source['url']}").bright
				}
			end
			# Meaning handler.
			#
			# @param mean [Array] Array of hashes.
			def mean(mean)
				a, b = 0, mean.length - 1
				while a <= b
					meaning = mean[a] #hash
					mtext = meaning['text']
					mlang = meaning['language']
					print Rainbow("Meaning|").bright
					puts "#{mtext}|#{mlang}|"
					mt = { 'meaning' => mtext }
					ml = { 'language' => mlang }
					Oversetter.tofile(mt)
					Oversetter.tofile(ml)
					a += 1
				end
			end
			# Phrase handler.
			#
			# @param phrase [Hash] A list of phrase/language pairs.
			def phrase(phrase)
				ptext = phrase['text']
				plang = phrase['language']
				print Rainbow("Phrase|").bright
				print "#{ptext}|#{plang}|"
				pt = { 'phrase' => ptext }
				pl = { 'language' => plang }
				Oversetter.tofile(pt)
				Oversetter.tofile(pl)
			end
		end
	end
end
