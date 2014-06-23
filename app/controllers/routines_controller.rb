class RoutinesController < UICollectionViewController
  # In app_delegate.rb or wherever you use this controller, just call .new like so:
  #   @window.rootViewController = RoutinesController.new
  #
  # Or if you're adding using it in a navigation controller, do this
  #  main_controller = RoutinesController.new
  #  @window.rootViewController = UINavigationController.alloc.initWithRootViewController(main_controller)

  ROUTINES_CELL_ID = "RoutinesCell"

  def self.new(args = {})
    # Set layout
    layout = UICollectionViewFlowLayout.alloc.init
    self.alloc.initWithCollectionViewLayout(layout)
  end

  def viewDidLoad
    super
    self.title = "Select a Routine"

    @routines = []

    rmq.stylesheet = RoutinesControllerStylesheet

    collectionView.tap do |cv|
      cv.registerClass(RoutinesCell, forCellWithReuseIdentifier: ROUTINES_CELL_ID)
      cv.delegate = self
      cv.dataSource = self
      cv.allowsSelection = true
      cv.allowsMultipleSelection = false
      rmq(cv).apply_style :collection_view
    end

    fetch_routines
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
    @routines.size
  end

  def collectionView(view, cellForItemAtIndexPath: index_path)
    view.dequeueReusableCellWithReuseIdentifier(ROUTINES_CELL_ID, forIndexPath: index_path).tap do |cell|
      rmq.build(cell) unless cell.reused

      # Update cell's data here
      cell.update(@routines[index_path.row])
    end
  end

  def collectionView(view, didSelectItemAtIndexPath: index_path)
    cell = view.cellForItemAtIndexPath(index_path)
    routine = @routines[index_path.row]
    puts "Selected at section: #{index_path.section}, row: #{index_path.row}"

    workout_controller = NewWorkoutController.new
    workout_controller.routine = routine
    self.navigationController.pushViewController(workout_controller, animated: true)
  end

  def fetch_routines
    AFMotion::JSON.get("http://b3ec157.ngrok.com/routines.json") do |result|
      if result.success?
        @routines = result.object
        collectionView.reloadData
      end
    end
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
