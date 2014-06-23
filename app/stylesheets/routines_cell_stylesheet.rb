module RoutinesCellStylesheet
  def cell_size
    {w: rmq.device.width - 20, h: 45}
  end

  def routines_cell(st)
    st.frame = cell_size
    # st.background_color = color.random

    # Style overall view here
  end

end
