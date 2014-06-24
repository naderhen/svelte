class NewWorkoutCellLayout < MotionKit::Layout
  view :exercise_label
  view :edit_label

  def layout
    # frame x: 0, y: 0, width: '100%', height: '100%1'

    add UILabel, :exercise_label do
      constraints do
        top_left x: 10, y: 10
        width 150
        height 25
      end
    end
  end
end
