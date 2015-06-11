desc 'Yandex operations'
command :ya do |dex|
	dex.desc 'Lists supported languages'
	#dex.arg_name 'word'
	dex.command :li do |list|
		list.flag :ui, :default_value => nil, :arg_name => 'string', :desc => '2-letter ISO 639-1 language code. If set, the response will contain a list of supported language codes and corresponding names in the given language'
		list.action do |global_options, options, args|
			search = args[0]
			if search == nil then search = 'blank'; end
			params = { ui: options[:ui] }
			lis = Oversetter::Yandex::Getlangs.new
			lis.get_lang(search, params)
		end
	end
	dex.desc 'Detects given language'
	dex.arg_name 'word'
	dex.command :det do |detect|
		detect.action do |global_options, options, args|
			search = args[0]
			params = {}
			dete = Oversetter::Yandex::Detect.new
			dete.detect(search, params)
		end
	end
	dex.desc 'Translates given text'
	dex.arg_name 'word'
	dex.command :tr do |translate|
		translate.flag :lang, :default_value => nil, :arg_name => 'string', :desc => "Translation direction. A single 2-letter ISO 639-1 language code (e.g. 'ru') or 2 codes separated by a hyphen (e.g. 'en-ru')"
		translate.action do |global_options, options, args|
			if args.length > 1
				search = args.join(' ')
			else
				search = args[0]
			end
			params = { lang: options[:lang] }
			tran = Oversetter::Yandex::Translate.new
			tran.get_trans(search, params)
		end
	end
end
