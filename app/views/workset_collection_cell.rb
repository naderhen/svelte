class WorksetCollectionCell < UICollectionViewCell
  attr_reader :reused
  attr_accessor :workset
  attr_accessor :custom_delegate

  def rmq_build
    rmq(self).apply_style :workset_collection_cell

    q = rmq(self.contentView)

    @layout = WorkSetCellLayout.new
    q.append(@layout.view)

    @weight_label = @layout.weight_label
    @rep_circle = @layout.rep_circle
    @rep_label = @layout.rep_label
  end

  def prepareForReuse
    @reused = true
  end

  def update(workset)
    @workset = workset
    set_views
  end

  def set_views
    @weight_label.text = @workset[:weight].to_s
    @weight_label.styleClass = 'h6 weight-label'

    @rep_label.styleClass = 'rep-label'

    @rep_circle.layer.borderWidth = 1.0
    @rep_circle.layer.borderColor = UIColor.whiteColor.CGColor

    if @workset[:accomplished_reps] > 0
      @rep_label.text = @workset[:accomplished_reps].to_s
      @rep_circle.styleClass = 'rep-circle-accomplished'
    else
      @rep_label.text = @workset[:prescribed_reps].to_s
      @rep_circle.styleClass = 'rep-circle'
    end
  end
end
