class WorksetCollectionCell < UICollectionViewCell
  attr_reader :reused

  def rmq_build
    rmq(self).apply_style :workset_collection_cell

    q = rmq(self.contentView)
    # Add your subviews, init stuff here
    # @foo = q.append(UILabel, :foo).get
  end

  def prepareForReuse
    @reused = true
  end

end
