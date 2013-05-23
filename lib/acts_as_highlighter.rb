#coding: utf-8

module ActsAsHighlighter

	DEFAULT_SYNTAX = "ruby"

	def code_block( content, syntax = DEFAULT_SYNTAX )
		"<pre class='brush: #{ syntax };>#{ h (content) }</pre>".html_safe
	end
end

class String
	def highlight( syntax = ActsAsHighlighter::DEFAULT_SYNTAX )
		code_block( self, syntax )
	end
end