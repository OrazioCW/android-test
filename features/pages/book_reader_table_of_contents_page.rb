module PageObjectModel
  class BookReaderTableOfContentsPage < PageObjectModel::Page
    trait "* id:'textview_tableofcontents' text:'Table of contents'"
    element :cover_link, "* id:'text1' text:'Cover'"
    element :title_page_link, "* id:'text1' text:'Title Page'"
    section :book_reader_static_toolbar, BookReaderStaticToolbarSection
  end
end

module PageObjectModel
  def book_reader_table_of_contents_page
    @_book_reader_table_of_contents_page ||= page(BookReaderTableOfContentsPage)
  end
end
