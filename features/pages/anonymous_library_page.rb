module PageObjectModel
	class AnonymousLibraryPage < PageObjectModel::Page
		trait "BBBTextView id:'textview_title'"
		element :home_button, "* id:'togglebutton_home'"
		element :signin_button, "TextView marked:'Sign in'"
		element :shop_button, "* id:'button_shop'"
		element :your_library_label, "* marked:'Your library'"
		element :book_cover_first, "BookCover index:0"
		@is_menu_open = false
		def open_first_book
			book_cover_first.click
		end
		def goto_shop
			shop_button.click
		end
		def toggle_menu
			home_button.click
			case @is_menu_open
			when false
				signin_button.wait_for_element_exists(timeout: 5)
				@is_menu_open = true
			when true
				signin_button.wait_for_element_does_not_exist(timeout: 5)
				@is_menu_open = false
			end
		end
		def toggle_menu_and_signin
			toggle_menu
			signin_button.click
		end
		def logged_out?
			!your_library_label.exists?
		end
	end

	def anonymous_library_page
		@_anonymous_library_page ||= page(AnonymousLibraryPage)
	end
end
