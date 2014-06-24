class WorkSetView < UIView
  attr_accessor :workset
  attr_accessor :weight_label
  attr_accessor :rep_circle
  attr_accessor :rep_label

  def self.new(args = {})
    self.alloc.init
  end

  def layout_views(editing=false)
    q = rmq(self)

    q.find(:weight_label, :rep_circle, :rep_label).remove

    q.apply_style :work_set_view

    @weight_label = q.append(UILabel, :weight_label).get
    @weight_label.text = @workset[:weight].to_s

    @rep_circle = q.append(UIView, :rep_circle).get

    @rep_label = q.append(UILabel, :rep_label).get

    if editing || @workset[:accomplished_reps] == 0
      @rep_label.text = @workset[:prescribed_reps].to_s
      @rep_circle.styleClass = 'rep-circle'
    else
      @rep_label.text = @workset[:accomplished_reps].to_s
      @rep_circle.styleClass = 'rep-circle-accomplished'
    end

    self
  end

  def increment_weight
    @workset[:weight] = @workset[:weight] + 10
    layout_views(true)
  end

  def decrement_weight
    @workset[:weight] = @workset[:weight] - 10
    layout_views(true)
  end

  def increment_reps
    @workset[:prescribed_reps] = @workset[:prescribed_reps] + 1
    layout_views(true)
  end


  def decrement_reps
    @workset[:prescribed_reps] = @workset[:prescribed_reps] - 1
    layout_views(true)
  end
end

