module LotsHelper
    def get_coords(lot, size=:medium)
      # returns a comma separted list of coordinates for use in an html map.
      # i.e. x1,y1,x2,y2,...etc
      x_resize_ratio = get_ratio_for_dimension( size, Parking::Application.config.x )
      y_resize_ratio = get_ratio_for_dimension( size, Parking::Application.config.y )

      coordinates = lot.coordinates.collect do |coord|
        "#{(coord.x * x_resize_ratio).ceil},#{(coord.y * y_resize_ratio).ceil}"
      end

      coordinates.join(',')
    end

    def get_image_name( size=:medium )
      "parking_square_#{size.to_s}.png"
    end

    def get_size_for_dimension( size, dim )
      Parking::Application.config.parking_image_size[size][dim]
    end

    private

    def get_ratio_for_dimension( size, dim )
      Parking::Application.config.parking_image_size[size][dim] / Parking::Application.config.parking_image_size[:original][dim].to_f
    end

end
