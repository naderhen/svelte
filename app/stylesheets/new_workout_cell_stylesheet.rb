module NewWorkoutCellStylesheet
  def cell_size
    {w: rmq.device.width - 20, h: 145}
  end

  def new_workout_cell(st)
    st.frame = cell_size
    st.background_color = color.random

    # Style overall view here
  end

  def new_workout_celL_layout_view(st)

  end

end
