module EditSetGroupCellStylesheet
  def cell_size
    {w: rmq.device.width - 20, h: 96}
  end

  def edit_set_group_cell(st)
    st.frame = cell_size
    # st.background_color = color.random

    # Style overall view here
  end

end
