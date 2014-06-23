class WorksetCollectionController < UICollectionViewController
  attr_accessor :worksets

  # In app_delegate.rb or wherever you use this controller, just call .new like so:
  #   @window.rootViewController = WorksetCollectionController.new
  #
  # Or if you're adding using it in a navigation controller, do this
  #  main_controller = WorksetCollectionController.new
  #  @window.rootViewController = UINavigationController.alloc.initWithRootViewController(main_controller)

  WORKSET_COLLECTION_CELL_ID = "WorksetCollectionCell"

  def self.new(args = {})
    # Set layout
    layout = UICollectionViewFlowLayout.alloc.init
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal
    self.alloc.initWithCollectionViewLayout(layout)
  end

  def viewDidLoad
    super
    rmq.stylesheet = WorksetCollectionControllerStylesheet



    collectionView.tap do |cv|
      cv.registerClass(WorksetCollectionCell, forCellWithReuseIdentifier: WORKSET_COLLECTION_CELL_ID)
      cv.delegate = self
      cv.dataSource = self
      cv.allowsSelection = true
      cv.allowsMultipleSelection = false
      rmq(cv).apply_style :collection_view
    end
  end

  # Remove if you are only supporting portrait
  def supportedInterfaceOrientations
    UIInterfaceOrientationMaskAll
  end

  # Remove if you are only supporting portrait
  def willAnimateRotationToInterfaceOrientation(orientation, duration: duration)
    rmq(:reapply_style).reapply_styles
  end

  def numberOfSectionsInCollectionView(view)
    1
  end

  def collectionView(view, numberOfItemsInSection: section)
    @worksets.size || 0
  end

  def collectionView(view, cellForItemAtIndexPath: index_path)
    view.dequeueReusableCellWithReuseIdentifier(WORKSET_COLLECTION_CELL_ID, forIndexPath: index_path).tap do |cell|
      rmq.build(cell) unless cell.reused

      # Update cell's data here
      cell.update(@worksets[index_path.row])
    end
  end

  def collectionView(view, didSelectItemAtIndexPath: index_path)
    cell = view.cellForItemAtIndexPath(index_path)
    workset = @worksets[index_path.row]
    puts "Selected at section: #{index_path.section}, row: #{index_path.row}"

    if workset[:accomplished_reps] == 0
      workset[:accomplished_reps] = workset[:prescribed_reps]
    else
      workset[:accomplished_reps] = workset[:accomplished_reps] - 1
    end

    cell.update(workset)
  end

end

__END__

# You don't have to reapply styles to all UIViews, if you want to optimize,
# another way to do it is tag the views you need to restyle in your stylesheet,
# then only reapply the tagged views, like so:
def logo(st)
  st.frame = {t: 10, w: 200, h: 96}
  st.centered = :horizontal
  st.image = image.resource('logo')
  st.tag(:reapply_style)
end

# Then in willAnimateRotationToInterfaceOrientation
rmq(:reapply_style).reapply_styles
