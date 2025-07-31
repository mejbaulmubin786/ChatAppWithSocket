import React from 'react'
import { useState } from 'react'

const App = () => {
  let [input, setInput]=useState("")
  let handelChange =(e)=>{
    setInput(e.target.value);
  }

  let handleTodo =()=>{
    console.log(input);
  }
  return (
    <>
      <input onChange={handelChange} type="text" />
      <button onClick={handleTodo}>Add ToDo</button>
    </>
  )
}

export default App