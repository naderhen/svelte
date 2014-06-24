class AppDelegate
  attr_reader :window

  def application(application, didFinishLaunchingWithOptions:launchOptions)
  	PixateFreestyle.initializePixateFreestyle

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    main_controller = RoutinesController.new
    @window.rootViewController = UINavigationController.alloc.initWithRootViewController(main_controller)

    @window.styleMode = PXStylingNormal

    setup_pixate_monitor if Device.simulator?
    PixateFreestyle.updateStylesForAllViews

    @window.makeKeyAndVisible
    true
  end

  def setup_pixate_monitor
    PixateFreestyle.styleSheetFromFilePath('/Users/naderhen/svelte/svelte/resources/default.css', withOrigin:PXStylesheetOriginApplication)
    # PixateFreestyle.styleSheetFromFilePath('/Users/nhendawi/Projects/svelte/resources/default.css', withOrigin:PXStylesheetOriginApplication)
    PixateFreestyle.currentApplicationStylesheet.monitorChanges = true
  end
end
