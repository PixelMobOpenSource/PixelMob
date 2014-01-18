class Point
    include Mongoid::Document
    field :x, type: Integer
    field :y , type: Integer
    embedded_in :annotation
end
