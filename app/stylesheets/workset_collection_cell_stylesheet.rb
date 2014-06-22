module WorksetCollectionCellStylesheet
  def cell_size
    {w: 25, h: 25}
  end

  def workset_collection_cell(st)
    st.frame = cell_size
    st.background_color = color.random

    # Style overall view here
  end

end
