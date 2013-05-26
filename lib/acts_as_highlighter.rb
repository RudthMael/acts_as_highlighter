#coding: utf-8

module ActsAsHighlighter

	@default_syntax = "ruby"

	class << self

		attr_accessor :default_syntax

		def code_block( content, *opts )
			params = {
				:brush => @default_syntax,
				:auto_links => true,
				:class_name => '',
				:gutter => true,
				:collapse => false,
				:first_line => 1,
				:highlight => "null",
				:html_script => false,
				:smart_tabs => true,
				:tab_size => 4,
				:toolbar => true
			}

			# сохраняем значения по умолчанию
			tmp = params.clone

			if opts[0].is_a? String
				params[:brush] = opts[0]
				params.merge!(opts[1]) if opts[1].is_a? Hash
			elsif opts[0].is_a? Hash
				params.merge!(opts[0])
			end

			# разгрузка html-кода от дефолтных опций
			params.delete_if{ |k,v| ( tmp[k] == v ) and ( k != :brush ) }

			parms_str = params.map{ |k,v| "#{k}: #{v}; " }.join.chop
					
			"<pre class=\"#{parms_str}\">#{content}</pre>".html_safe
		end

	end

	class Engine < Rails::Engine
  	end

end

class String
	def highlight( *params )
		ActsAsHighlighter.code_block( self, *params )
	end
end
