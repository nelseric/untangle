require 'pry'
define_behavior :controlled do
  requires :director, :input_manager

  setup do
    actor.has_attributes :moving_left, :moving_right, :moving_up, :moving_down

    actor.has_attribute :speed
    actor.speed = 5

    input_manager.reg :down, KbLeft do
      actor.moving_left = true
    end
    input_manager.reg :up, KbLeft do
      actor.moving_left = false
    end

    input_manager.reg :down, KbRight do
      actor.moving_right = true
    end
    input_manager.reg :up, KbRight do
      actor.moving_right = false
    end

    input_manager.reg :down, KbUp do
      actor.moving_up = true
    end
    input_manager.reg :up, KbUp do
      actor.moving_up = false
    end

    input_manager.reg :down, KbDown do
      actor.moving_down = true
    end
    input_manager.reg :up, KbDown do
      actor.moving_down = false
    end


    input_manager.reg :down, KbLeftShift do
      actor.speed = 1
    end
    input_manager.reg :up, KbLeftShift do
      actor.speed = 5
    end

    director.when :update do |time|
      
      actor.x -= actor.speed if actor.moving_left
      actor.x += actor.speed if actor.moving_right
      actor.y -= actor.speed if actor.moving_up
      actor.y += actor.speed if actor.moving_down

    end
  end

  helpers do

  end
end
