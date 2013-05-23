#coding: utf-8

module ActsAsHighlighter

	@default_syntax = "ruby"

	class << self

		attr_accessor :default_syntax

		def code_block( content, syntax = default_syntax )
			# как добавить эскейпинг входной строки?
			"<pre class='brush: #{syntax};'>#{content}</pre>".html_safe
		end

	end

	class Engine < Rails::Engine
  	end

end

class String
	def highlight( syntax = ActsAsHighlighter.default_syntax )
		ActsAsHighlighter.code_block( self, syntax )
	end
end
