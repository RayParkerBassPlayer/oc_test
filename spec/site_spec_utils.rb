module SiteSpecUtils
  def log_in(user = nil)
    user ||= create(:user)
    visit root_path
    click_link "Log In"

    fill_in "email", :with => user.email
    fill_in "password", :with => user.password
    click_button "Log In!"

    user
  end

  def valid_password
    "secret"
  end

  def saop
    save_and_open_page
  end

  def ssoi
    screenshot_and_open_image
  end

  def blows_up
    raise "Hell"
  end

  alias_method :blow_up, :blows_up

  # Does a pp on the thing with title and other info to aid in debugging
  def debug_print(thing, title = nil, print_path = false)
    return if !%w[test development].include?(Rails.env)

    divider = "#{"-" * 80}"

    puts divider
    if title.present?
      puts %Q(#{title} (#{thing.class.name}))
    else
      puts thing.class.name
    end
    pp thing

    if print_path
      puts caller.first[0..caller.first.index(":in") - 1]
    end

    puts divider

    puts
  end
  alias_method :dp, :debug_print

  # Use to call a bunch of #debug_print statements to group them together.  Helpful when dealing with multiple files and
  # blocks of interest.
  def debug_print_wrapper(title = nil, print_path = true, &block)
    return if !%w[test development].include?(Rails.env)

    start_divider = "#{">" * 80}"
    end_divider = "#{"<" * 80}"


    if title.present?
      puts " #{title} ".upcase.center(80, start_divider[0])
    else
      puts divider
    end

    block.call

    if print_path
      puts " Wrapped from block call at: ".center(80, "-")
      puts caller.first[0..caller.first.index(":in") - 1]
    end

    puts end_divider
    puts
  end
  alias_method :dpw, :debug_print_wrapper

  def default_zip
    Zip.find("43659")
  end
end
