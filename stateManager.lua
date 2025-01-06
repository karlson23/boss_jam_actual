local StateManager = {state = {}, current_state = "none"}

function StateManager:registerState(stateName, state)

  if state == nil or stateName == nil then
    print("bad")
    return
  end

  StateManager.state[stateName] = state

end

function StateManager:switchTo(stateName)


  if StateManager.state[stateName] then
    print("Valid state")
  else
    print("Invalid state!")
    return
  end


  if StateManager.current_state and StateManager.current_state.onExit then
    StateManager.current_state:onExit()
  end


  if StateManager.current_state then
    StateManager.current_state = StateManager.state[stateName]
  end

  if StateManager ~= nil and StateManager.current_state and StateManager.current_state.onEnter  then
    StateManager.current_state:onEnter()
  end

end


function StateManager:update(dt)
  if StateManager.current_state.update then
   StateManager.current_state:update(dt)
  end
end

function StateManager:draw()
  if StateManager.current_state.draw then
    StateManager.current_state:draw()
  end
end

return StateManager

