class EditSetGroupCell < UICollectionViewCell
  attr_reader :reused

  def rmq_build
    rmq(self).apply_style :edit_set_group_cell

    q = rmq(self.contentView)
    # Add your subviews, init stuff here
    # @foo = q.append(UILabel, :foo).get
  end

  def prepareForReuse
    @reused = true
  end

  def update(workset)
    ws_view = rmq(self.contentView).append(WorkSetView).get
    ws_view.workset = workset
    ws_view.layout_views(true)
    rmq(ws_view).frame = {l: 10, t: 10, w: 50, h: 85}

    rmq(ws_view).on(:swipe_up) do |sender, event|
      sender.increment_reps
    end

    rmq(ws_view).on(:swipe_down) do |sender, event|
      sender.decrement_reps
    end

    rmq(ws_view).on(:swipe_left) do |sender, event|
      sender.decrement_weight
    end

    rmq(ws_view).on(:swipe_right) do |sender, event|
      sender.increment_weight
    end

  end

end
