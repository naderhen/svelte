class NewWorkoutControllerStylesheet < ApplicationStylesheet

  include NewWorkoutCellStylesheet

  def setup
    # Add stylesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb

    @margin = ipad? ? 12 : 8
  end

  def root_view(st)
    st.background_color = color.black
  end

  def collection_view(st)
    st.view.contentInset = [@margin, @margin, @margin, @margin]
    st.background_color = color.black

    st.view.collectionViewLayout.tap do |cl|
      cl.itemSize = [cell_size[:w], cell_size[:h]]
      #cl.scrollDirection = UICollectionViewScrollDirectionHorizontal
      #cl.headerReferenceSize = [cell_size[:w], cell_size[:h]]
      cl.minimumInteritemSpacing = @margin
      cl.minimumLineSpacing = @margin
      #cl.sectionInset = [0,0,0,0]
    end
  end
end
