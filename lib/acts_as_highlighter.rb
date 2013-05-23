#coding: utf-8

module ActsAsHighlighter

	@default_syntax = "ruby"

	class << self

		attr_accessor :default_syntax

		def code_block( content, syntax = default_syntax )
			# как добавить эскейпинг входной строки?
			"<pre class='brush: #{syntax};'>(content)</pre>".html_safe
		end

	end

end

class String
	def highlight( syntax = ActsAsHighlighter::DEFAULT_SYNTAX )
		code_block( self, syntax )
	end
end