class HomeControllerStylesheet < ApplicationStylesheet
  # Add your view stylesheets here. You can then override styles if needed, example:
  # include FooStylesheet

  def setup
    # Add stylesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
    st.background_color = color.black
  end

  def new_workout_label(st)
    st.color = rmq.color.white
    st.view.userInteractionEnabled = true
    st.text = "+ New Workout"
    st.view.textAlignment = UITextAlignmentCenter
    st.view.styleClass = 'h2 text-accent'
  end

  def view_workouts_label(st)
    st.color = rmq.color.white
    st.view.userInteractionEnabled = true
    st.text = "View Workouts"
    st.view.textAlignment = UITextAlignmentCenter
    st.view.styleClass = 'h4 text-accent'
  end
end
