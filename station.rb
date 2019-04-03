class Station
# Может возвращать список всех поездов на станции, находящиеся в текущий момент
  attr_reader :trains, :name
  
# Имеет название, которое указывается при ее создании  
  def initialize(name)
    @name = name
    @trains = []
  end

# Может принимать поезда (по одному за раз)
  def take_train(train)
    @trains << train
  end

# Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
  def list(type)
    @trains.select { |train| train.type == type }
  end        
# Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).
  def send_train(train)
    @trains.delete(train)
  end
end
