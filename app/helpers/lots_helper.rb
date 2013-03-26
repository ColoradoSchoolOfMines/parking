module LotsHelper
    def get_coords(lot)
        # returns a comma separted list of coordinates for use in an html map.
        # i.e. x1,y1,x2,y2,...etc
        coordinates = lot.coordinates.collect do |coord|
            "#{coord.x},#{coord.y}"
        end

        coordinates.join(',')
    end

end
