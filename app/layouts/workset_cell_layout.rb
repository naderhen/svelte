class WorkSetCellLayout < MotionKit::Layout
  view :weight_label
  view :rep_circle
  view :rep_label

  def layout
    add UIView, :rep_circle do
      background_color rmq.color.red
      layer do
        corner_radius 20
      end
      constraints do
        top_left x: 0, y: -20
        width 40
        height 40
      end

      add UILabel, :rep_label do
        text_alignment UITextAlignmentCenter
        constraints do
          top_left x: 0, y: 0
          width 40
          height  40
        end
      end
    end

    add UILabel, :weight_label do
      text_alignment UITextAlignmentCenter
      constraints do
        top_left x: 0, y: 30
        width 40
        height 25
      end
    end
  end
end