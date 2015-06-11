desc 'Hablaa operations'
command :ha do |blaa|
	blaa.desc 'Lists supported languages'
	blaa.arg_name 'word'
	blaa.command :li do |list|
		list.action do |global_options, options, args|
			search, params = args[0], nil
			if search == nil then search = 'blank'; end
			lang = Oversetter::Hablaa::Getlangs.new
			lang.get_lang(search, params)
		end
	end
	blaa.desc 'Translates given text'
	blaa.arg_name 'word'
	blaa.command :tr do |translate|
		translate.flag :src, :default_value => nil, :arg_name => 'string', :desc => '3-letter ISO 693-3 source language code (Required)'
		translate.flag :tar, :default_value => nil, :arg_name => 'string', :desc => '3-letter ISO 693-3 source language code (Required)'
		translate.action do |global_options, options, args|
			if args.length > 1
				search = args.join(' ')
			else
				search = args[0]
			end
			params = { src: options[:src], tar: options[:tar] }
			trans = Oversetter::Hablaa::Translate.new
			trans.get_trans(search, params)
		end
	end
	blaa.desc 'Fetches examples'
	blaa.arg_name 'word'
	blaa.command :ex do |example|
		example.flag :esrc, :default_value => nil, :arg_name => 'string', :desc => '3-letter ISO 693-3 source language code (Required)'
		example.flag :etar, :default_value => nil, :arg_name => 'string', :desc => '3-letter ISO 693-3 source language code (Required)'
		example.action do |global_options, options, args|
			if args.length > 1
				search = args.join(' ')
			else
				search = args[0]
			end
			params = { src: options[:esrc], tar: options[:etar] }
			trans = Oversetter::Hablaa::Example.new
			trans.get_ex(search, params)
		end
	end
	blaa.desc 'Fetches similar translations'
	blaa.arg_name 'word'
	blaa.command :si do |similar|
		similar.flag :ssrc, :default_value => nil, :arg_name => 'string', :desc => '3-letter ISO 693-3 source language code (Required)'
		similar.flag :star, :default_value => nil, :arg_name => 'string', :desc => '3-letter ISO 693-3 source language code (Required)'
		similar.action do |global_options, options, args|
			if args.length > 1
				search = args.join(' ')
			else
				search = args[0]
			end
			params = { src: options[:ssrc], tar: options[:star] }
			trans = Oversetter::Hablaa::Similar.new
			trans.get_sim(search, params)
		end
	end
end
