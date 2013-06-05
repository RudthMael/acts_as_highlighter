//= require jquery
//= require ./shCore
//= require_tree .
//= require_self

// dump
//<% unless ActsAsHighlighter.use_brushes != "all" %>
//<% ActsAsHighlighter.use_brushes.each do |b| %>
//<%= "//= require ./shBrush#{b}\n" %>
//<% end %>
//<% else %>
//<%= "//= require_tree ." %>
//<% end %>
//

	SyntaxHighlighter.all();