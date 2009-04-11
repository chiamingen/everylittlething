# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
	def tableize(objects, items_per_row, table_attr = {}, &block)
		table_attr.merge!(:width => '100%')
		td_width = 100/items_per_row

		table_content = ""
		objects.in_groups_of(items_per_row) do | obj_group |
			tr_content = ""
			obj_group.each do | obj |
				td_content = obj.nil? ? "" : capture(obj, &block)
				tr_content << content_tag(:td, td_content, :width => "#{td_width}%")
			end
			table_content << content_tag(:tr, tr_content)
		end

		concat content_tag(:table, table_content, table_attr), block.binding
	end
end
