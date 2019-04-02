class Route
  attr_reader :stations
# Имеет начальную и конечную станцию, а также список промежуточных станций. 
# Начальная и конечная станции указываютсся при создании маршрута, а промежуточные могут добавляться между ними.
  def initialize(start_station, end_station)
    @stations = [start_station, end_station]
  end
# Может добавлять промежуточную станцию в список
  def add_station(station)
    @stations.insert(-2, station)
  end
# Может удалять промежуточную станцию из списка
  def delete_station(station)
    @stations.delete(station) if station != @stations.first && station != @stations.last
  end
# Может выводить список всех станций по-порядку от начальной до конечной
  def list_station
    @stations.each { |station| puts station.name }
  end
end
