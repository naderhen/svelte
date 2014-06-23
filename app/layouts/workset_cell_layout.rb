class WorkSetCellLayout < MotionKit::Layout
  view :weight_label
  view :rep_circle
  view :rep_label

  def layout
    add UIView, :rep_circle do
      layer do
        border_width 3
        border_color rmq.color.white
        corner_radius 25
      end
      constraints do
        top_left x: 0, y: -20
        width 50
        height 50
      end

      add UILabel, :rep_label do
        text_alignment UITextAlignmentCenter
        constraints do
          top_left x: 0, y: 0
          width 50
          height  50
        end
      end
    end

    add UILabel, :weight_label do
      text_alignment UITextAlignmentCenter
      constraints do
        top_left x: 0, y: 40
        width 50
        height 25
      end
    end
  end
end
