class NewWorkoutCell < UICollectionViewCell
  attr_reader :reused

  def rmq_build
    rmq(self).apply_style :new_workout_cell

    q = rmq(self.contentView)
    # Add your subviews, init stuff here
    # @foo = q.append(UILabel, :foo).get

    self.contentView.styleClass = 'new_workout_cell'

    @layout = NewWorkoutCellLayout.new
    @layout.view.frame = self.contentView.frame
    q.append(@layout.view, :new_workout_celL_layout_view)

    @exercise_label = @layout.exercise_label
  end

  def prepareForReuse
    @reused = true
  end

  def update(setGroup)
    @exercise_label.text = setGroup[:exercise][:name]
    @exercise_label.styleClass = 'h5 exercise-label'

    @workset_collection = WorksetCollectionController.new
    @workset_collection.setGroup = setGroup
    @workset_collection.view.styleClass = "workset_collection"

    rmq(self.contentView).append(@workset_collection.view)

    @workset_collection.view.frame = [[10, 45], [280, 95]]
  end
end
