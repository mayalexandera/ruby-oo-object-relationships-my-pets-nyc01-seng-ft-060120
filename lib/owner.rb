require_relative './cat.rb'
require_relative './dog.rb'
class Owner
  @@all = []
  attr_reader :name, :species

  def initialize(name=nil, species = "human")
    @name=name
    @species=species
    @cats = []
    @@all<<self
  end

  def say_species
    return "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all = []
  end

  def cats 
    Cat.all.select {|cat| cat.owner == self}
  end
  
  def dogs 
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(cat)
    Cat.new(cat, self)
  end

  def buy_dog(dog)
    Dog.new(dog, self)
  end

  def walk_dogs
    self.dogs.each{|dog| dog.mood="happy"}
  end

  def feed_cats
    self.cats.each{|cat| cat.mood="happy"}
  end

  def sell_pets
    pets = self.cats + self.dogs
    pets.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.length} dog(s), and #{self.cats.length} cat(s)."
  end



end