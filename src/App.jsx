import React from 'react'
import { useState } from 'react'

const App = () => {
  let [input, setInput]=useState("")
  let [arr, setArr]=useState([])
  /*
  let handelChange =(e)=>{
    setInput(e.target.value);
  }
  */

  let handleTodo =()=>{
    //let arr2 = [...arr]
    //arr2.push(input)
    //setArr(arr2)
    setArr([...arr, input]);
    setInput("");
    
  }

  
  return (
    <>
      <input onChange={(e)=>setInput(e.target.value) /*handelChange*/} type="text" />
      <button onClick={handleTodo}>Add ToDo</button>
      <ul>
        {
          arr.map(item=>(
            <li>{item}</li>
          ))
        }
      </ul>
    </>
  )
}

export default App