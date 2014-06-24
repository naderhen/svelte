class HomeController < UIViewController

  def viewDidLoad
    super

    rmq.stylesheet = HomeControllerStylesheet
    rmq(self.view).apply_style :root_view

    # Create your views here

    @new_workout_label = rmq(self.view).append(UILabel, :new_workout_label).get
    @new_workout_label.frame = [[0, 125], [self.view.frame.size.width, 50]]
    rmq(@new_workout_label).on(:tap) do |sender, event|
      self.navigationController.pushViewController(RoutinesController.new, animated: true)
    end

    @view_workouts_label = rmq(self.view).append(UILabel, :view_workouts_label).get
    @view_workouts_label.frame = [[0, 200], [self.view.frame.size.width, 50]]
  end

  # Remove if you are only supporting portrait
  def supportedInterfaceOrientations
    UIInterfaceOrientationMaskAll
  end

  # Remove if you are only supporting portrait
  def willAnimateRotationToInterfaceOrientation(orientation, duration: duration)
    rmq.all.reapply_styles
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
