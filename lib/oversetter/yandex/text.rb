# coding: utf-8
%w{httpi multi_json multi_xml open-uri rainbow}.map { |lib| require lib }

module Oversetter
	# Yandex.com's service provides translations and detections.
	class Yandex
		# Fetches dynamically generated URL. Functions are translate,
		# detect, and getLangs.
		#
		# @param search [String] The word or phrase to search for.
		# @param func [String] The search function to use.
		# @param params [Hash] The search parameters to use.
		# @param result [String] The search response.
    def get_word(search, func, params, result)
			search = URI.encode(search)
			prefix = 'https://translate.yandex.net/api/v1.5/tr.json/'
			word, pcont = "#{prefix}#{func}?", []
			if func != 'getLangs' then pcont.push "text=#{search}&"; end
      params.map { |k, v|
        if k == :lang then pcont.push "lang=#{v}&"; end
				if k == :ui then pcont.push "ui=#{v}&"; end
      }
			if func == 'translate' || func == 'detect' then pcont.push 'format=plain&'; end
			if func == 'translate' then pcont.push 'options=1&'; end
      apikey = ENV['YANDEX']
			pcont.push "key=#{apikey}"
      url = "#{word}#{pcont.join}"
      request = HTTPI::Request.new(url)
      getter = HTTPI.get(request)
      result = getter.body
    end
  end
end
