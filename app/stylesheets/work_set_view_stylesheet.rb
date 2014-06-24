module WorkSetViewStylesheet

  def work_set_view(st)

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
    st.view.styleClass = 'h3 rep-label'
    st.text_alignment = UITextAlignmentCenter
  end

  def edit_button(st)
    st.frame = {l: 250, t: 10, w: 50, h: 25}
    st.view.styleClass = 'h5 edit-label'

    st.text = "Edit"
  end
end
