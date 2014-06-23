class NewWorkoutController < UIViewController
  # In app_delegate.rb or wherever you use this controller, just call .new like so:
  #   @window.rootViewController = NewWorkoutController.new
  #
  # Or if you're adding using it in a navigation controller, do this
  #  main_controller = NewWorkoutController.new
  #  @window.rootViewController = UINavigationController.alloc.initWithRootViewController(main_controller)

  NEW_WORKOUT_CELL_ID = "NewWorkoutCell"

  # def self.new(args = {})
  #   # Set layout
    
  # end

  def viewDidLoad
    super

    self.title = "New Workout"

    @workout = {
      setGroups: []
    }

    @routine = {
      id: 1234,
      name: "Workout A",
      steps: [
        {id: 1, start_weight: 100, weight_increment: 20, set_reps: [12, 10, 8, 6], exercise: {id: 12, name: "Front Squat"}},
        {id: 2, start_weight: 100, weight_increment: 20, set_reps: [12, 10, 8, 6], exercise: {id: 13, name: "Overhead Press"}},
        {id: 3, start_weight: 100, weight_increment: 20, set_reps: [12, 10, 8, 6], exercise: {id: 14, name: "Dips"}},
        {id: 4, start_weight: 100, weight_increment: 20, set_reps: [12, 10, 8, 6], exercise: {id: 15, name: "Military Press"}},
        {id: 5, start_weight: 100, weight_increment: 20, set_reps: [12, 10, 8, 6], exercise: {id: 16, name: "Bench Press"}},
      ]
    }

    @routine[:steps].each do |step|
      setGroup = {exercise: step[:exercise], worksets: []};
      @workout[:setGroups].push(setGroup)

      step[:set_reps].each_with_index do |rep_num, idx|
        new_weight = idx == 0 ? step[:start_weight] : setGroup[:worksets][idx - 1][:weight] + step[:weight_increment]
        setGroup[:worksets].push({exercise: step[:exercise], weight: new_weight, prescribed_reps: rep_num, accomplished_reps: 0})
      end
    end

    rmq.stylesheet = NewWorkoutControllerStylesheet
    rmq(self.view).apply_style :root_view
    
    layout = UICollectionViewFlowLayout.alloc.init
    @collectionView = UICollectionView.alloc.initWithFrame([[0, 0], [self.view.frame.size.width, self.view.frame.size.height - 100]], collectionViewLayout:layout)

    rmq(self.view).append(@collectionView)

    @collectionView.tap do |cv|
      cv.registerClass(NewWorkoutCell, forCellWithReuseIdentifier: NEW_WORKOUT_CELL_ID)
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
    @workout[:setGroups].size
  end

  def collectionView(view, cellForItemAtIndexPath: index_path)
    view.dequeueReusableCellWithReuseIdentifier(NEW_WORKOUT_CELL_ID, forIndexPath: index_path).tap do |cell|
      rmq.build(cell) unless cell.reused

      # Update cell's data here
      cell.update(@workout[:setGroups][index_path.row])
    end
  end

  def collectionView(view, didSelectItemAtIndexPath: index_path)
    cell = view.cellForItemAtIndexPath(index_path)
    puts "Selected at section: #{index_path.section}, row: #{index_path.row}"
  end

end
