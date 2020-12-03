require 'pry'

class Owner
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    return "I am a #{species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all = []
  end

  def cats
    #binding.pry
    owned = []
    Cat.all.collect{|x| owned << x if x.owner == self}
    owned
  end

  def dogs
    #binding.pry
    owned = []
    Dog.all.collect{|x| owned << x if x.owner == self}
    owned
  end
  
  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    dogs.each{|x| x.mood=("happy")}
  end

  def feed_cats
    cats.each{|x| x.mood=("happy")}
  end

  def sell_pets
    cats.each{|x| x.mood=("nervous")}
    cats.each{|x|x.owner=(nil)}
    dogs.each{|x| x.mood=("nervous")}
    dogs.each{|x|x.owner=(nil)}
  end

  def list_pets
    return "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end

end