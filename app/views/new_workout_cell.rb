class NewWorkoutCell < UICollectionViewCell
  attr_reader :reused
  attr_accessor :custom_delegate

  def rmq_build
    rmq(self).apply_style :new_workout_cell

    q = rmq(self.contentView)

    self.contentView.styleClass = 'new_workout_cell'

    @exercise_label = q.append(UILabel, :exercise_label).get
  end

  def prepareForReuse
    @reused = true
  end

  def update(setGroup)
    # Cleanup
    rmq(self.contentView).find(:work_set_view).remove

    @exercise_label.text = setGroup[:exercise][:name]

    @edit_button = rmq(self.contentView).append(UIButton, :edit_button)

    @edit_button.on(:tap) do |sender, event|
      @custom_delegate.edit_set_group(setGroup)
    end
    
    setGroup[:worksets].each_with_index do |workset, index|
      ws_view = rmq(self.contentView).append(WorkSetView).get
      ws_view.workset = workset
      ws_view.layout_views
      rmq(ws_view).frame = {l: (60 * index) + 10, t: 45, w: 50, h: 85}

      rmq(ws_view).on(:tap) do |sender, event|
        if workset[:accomplished_reps] == 0
          workset[:accomplished_reps] = workset[:prescribed_reps]
        else
          workset[:accomplished_reps] = workset[:accomplished_reps] - 1
        end

        ws_view.layout_views
      end
    end
  end
end
