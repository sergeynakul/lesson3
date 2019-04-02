class Train
# Может набирать скорость и Может возвращать текущую скорость
  attr_accessor :speed
# Может возвращать количество вагонов и тип вагона
  attr_reader :quantity_carriage, :type
# Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов, эти данные указываются при создании экземпляра класса
  def initialize(number, type, quantity_carriage)
    @number = number
    @type = type
    @quantity_carriage = quantity_carriage
    @speed = 0
  end
# Может тормозить (сбрасывать скорость до нуля)
  def stop
    @speed = 0
  end
# Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает количество вагонов). 
# Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
  def attach_carriage
    @quantity_carriage += 1 if @speed == 0
  end
  def detach_carriage
    @quantity_carriage -= 1 if @speed == 0 && @quantity_carriage > 0
  end
# Может принимать маршрут следования (объект класса Route). 
# При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
  def take_route(route)
    @route = route
    @route.stations.first.take_train(self)
    @station_index = 0
  end
# Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад, но только на 1 станцию за раз.
  def go_forward
    return if next_station.nil?
    current_station.send_train(self)
    next_station.take_train(self)
    @station_index += 1
  end

  def go_back
    return if previous_station.nil?
    current_station.send_train(self)
    previous_station.take_train(self)
    @station_index -= 1
  end

# Возвращать предыдущую станцию, текущую, следующую, на основе маршрута
  def current_station
    @route.stations[@station_index]
  end

  def next_station
    @route.stations[@station_index + 1] if @route.stations.length > @station_index + 1
  end

  def previous_station
    @route.stations[@station_index - 1] if @station_index > 0
  end
end
