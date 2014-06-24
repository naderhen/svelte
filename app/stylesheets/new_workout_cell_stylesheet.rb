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


  def workset_view(st)
    # st.background_color = color.random
  end

  def weight_label(st)
    st.frame = {l: 0, t: 60, w: 50, h: 25}
    st.view.styleClass = 'h6 weight-label'
    st.text_alignment = UITextAlignmentCenter
  end

  def rep_circle(st)
    st.frame = {l: 0, t: 0, w: 50, h: 50}
    st.view.layer.borderWidth = 1.0
    st.view.layer.borderColor = UIColor.whiteColor.CGColor
    st.view.layer.cornerRadius = 25
  end

  def rep_label(st)
    st.frame = {l: 0, t: 0, w: 50, h: 50}
    st.view.styleClass = 'rep-label'
    st.text_alignment = UITextAlignmentCenter
  end
end
