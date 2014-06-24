module NewWorkoutCellStylesheet
  def cell_size
    {w: rmq.device.width - 20, h: 145}
  end

  def new_workout_cell(st)
    st.frame = cell_size
    # st.background_color = color.random

    # Style overall view here
  end

  def new_workout_cell_layout_view(st)

  end

  def exercise_label(st)
    st.frame = {l: 10, y: 10, w: 150, h: 25}
    st.view.styleClass = 'p exercise-label'
  end
end
