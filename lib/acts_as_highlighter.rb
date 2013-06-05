#coding: utf-8

module ActsAsHighlighter

	@default_syntax = "ruby"

	@use_brushes = "all"
	#available values:
	# 	* all
	# 	* [ brushes list ]
	# example:
	# => [ "AS3", "Bash" ]
	# available:
	# 	* AS3
	# 	* Ada
	# 	* Ahk
	# 	* AppleScript
	# 	* Asm
	# 	* Bash
	# 	* Bat
	# 	* CSharp
	# 	* Clojure
	# 	* ColdFusion
	# 	* Cpp
	# 	* Css
	# 	* Delphi
	# 	* Diff
	# 	* Erlang
	# 	* Groovy
	# 	* Script
	# 	* Java
	# 	* JavaFx
	# 	* Latex
	# 	* Lua
	# 	* Nasm8086
	# 	* Perl
	# 	* Php
	# 	* PowerShell
	# 	* Python
	# 	* Ruby
	# 	* Sass
	# 	* Scala
	# 	* Sql
	# 	* Vb
	# 	* Xml
	# 	* Yaml

	# on|off autoloader
	@autoloader = false

	@theme = "Default"
	# Available:
	# 	* Default
	# 	* Django,
	# 	* Eclipse,
	# 	* Emacs,
	# 	* FadeToGrey,
	# 	* MDUltra,
	# 	* Midnight,
	# 	* RDark

	@defaults = {
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

	class << self

		attr_accessor :default_syntax, :defaults, :theme, :autoloader,
			:use_brushes

		def code_block( content, *opts )
			# копируем значения по умолчанию
			params = @defaults.clone

			if opts[0].is_a? String
				params[:brush] = opts[0]
				params.merge!(opts[1]) if opts[1].is_a? Hash
			elsif opts[0].is_a? Hash
				params.merge!(opts[0])
			end

			# разгрузка html-кода от дефолтных опций
			params.delete_if{ |k,v| ( @defaults[k] == v ) and ( k != :brush ) }

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
