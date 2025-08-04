import React from 'react'
import { useState } from 'react'
import { getDatabase, ref, set, push } from "firebase/database";

const App = () => {
  const db = getDatabase();
  let [input, setInput]=useState("")
  let [arr, setArr]=useState([])

  let handleTodo =()=>{
    set(push(ref(db, 'alldata/')), {
    name: input,
    
  }).then(()=>{
    console.log("send date to database")
    setInput("")
  });
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