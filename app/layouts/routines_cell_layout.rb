class RoutinesCellLayout < MotionKit::Layout
  view :routine_label

  def layout
    # frame x: 0, y: 0, width: '100%', height: '100%1'

    add UILabel, :routine_label do
      constraints do
        top_left x: 10, y: 0
        width 150
        height 45
      end
    end
  end
end
