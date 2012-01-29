module StudiosHelper
  def studio_city_state_postal(studio)
    "#{studio.city}, #{studio.state}  #{studio.postal_code}"
  end
end
