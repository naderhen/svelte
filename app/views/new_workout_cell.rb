class NewWorkoutCell < UICollectionViewCell
  attr_reader :reused
  attr_accessor :custom_delegate

  def rmq_build
    rmq(self).apply_style :new_workout_cell

    q = rmq(self.contentView)

    self.contentView.styleClass = 'new_workout_cell'

    @layout = NewWorkoutCellLayout.new
    @layout.view.frame = self.contentView.frame
    q.append(@layout.view, :new_workout_cell_layout_view)

    @exercise_label = @layout.exercise_label
  end

  def prepareForReuse
    @reused = true
  end

  def update(setGroup)
    # Cleanup
    rmq(self.contentView).find(:workset_view).remove

    @exercise_label.text = setGroup[:exercise][:name]
    @exercise_label.styleClass = 'h5 exercise-label'

    
    setGroup[:worksets].each_with_index do |workset, index|
      new_view = rmq(self.contentView).append(UIView, :workset_view)
      new_view.frame = {l: (60 * index) + 10, t: 45, w: 50, h: 85}

      weight_label = new_view.append(UILabel, :weight_label).get
      weight_label.text = workset[:weight].to_s

      rep_circle = new_view.append(UIView, :rep_circle).get

      rmq(rep_circle).on(:tap) do |sender, event|
        if workset[:accomplished_reps] == 0
          workset[:accomplished_reps] = workset[:prescribed_reps]
        else
          workset[:accomplished_reps] = workset[:accomplished_reps] - 1
        end

        update(setGroup)
      end

      rep_label = new_view.append(UILabel, :rep_label).get

      if workset[:accomplished_reps] > 0
        rep_label.text = workset[:accomplished_reps].to_s
        rep_circle.styleClass = 'rep-circle-accomplished'
      else
        rep_label.text = workset[:prescribed_reps].to_s
        rep_circle.styleClass = 'rep-circle'
      end
    end
  end
end
