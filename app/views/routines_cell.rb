class RoutinesCell < UICollectionViewCell
  attr_reader :reused

  def rmq_build
    rmq(self).apply_style :routines_cell

    q = rmq(self.contentView)
    self.contentView.styleClass = 'routine-cell'

    @layout = RoutinesCellLayout.new
    @layout.view.frame = self.contentView.frame
    q.append(@layout.view)

    @routine_label = @layout.routine_label

  end

  def prepareForReuse
    @reused = true
  end

  def update(routine)
    @routine_label.text = routine[:name]
    @routine_label.styleClass = 'routine-label h4'
  end
end
