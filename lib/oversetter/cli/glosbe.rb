desc 'Glosbe operations'
command :gl do |osbe|
	osbe.desc 'Translates given text'
	osbe.arg_name 'word'
	osbe.command :tr do |translate|
		translate.flag :src, :default_value => nil, :arg_name => 'string', :desc => '3-letter ISO 693-3 source language code (Required)'
		translate.flag :tar, :default_value => nil, :arg_name => 'string', :desc => '3-letter ISO 693-3 target language code (Required)'
		translate.switch :auth, :default_value => false, :desc => 'Show authors'
		translate.action do |global_options, options, args|
			if args.length > 1
				search = args.join(' ')
			else
				search = args[0]
			end
			params = { src: options[:src], tar: options[:tar], auth: options[:auth] }
			tran = Oversetter::Glosbe::Translate.new
			tran.get_trans(search, params)
		end
	end
	osbe.desc 'Fetches examples'
	osbe.arg_name 'word'
	osbe.command :ex do |example|
		example.flag :esrc, :default_value => nil, :arg_name => 'string', :desc => '3-letter ISO 693-3 source language code (Required)'
		example.flag :etar, :default_value => nil, :arg_name => 'string', :desc => '3-letter ISO 693-3 target language code (Required)'
		example.flag :page, :default_value => 1, :arg_name => 'integer', :desc => 'Page of results to be displayed (200 Max)'
		example.flag :size, :default_value => 1, :arg_name => 'integer', :desc => 'Size of the result page (30 Max)'
		example.action do |global_options, options, args|
			if args.length > 1
				search = args.join(' ')
			else
				search = args[0]
			end
			params = { src: options[:esrc], tar: options[:etar], page: options[:page], size: options[:size] }
			ex = Oversetter::Glosbe::Example.new
			ex.get_ex(search, params)
		end
	end
end
