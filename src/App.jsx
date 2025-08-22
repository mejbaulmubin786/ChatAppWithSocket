import React from 'react'
import { useState } from 'react'
import { getDatabase, ref, set, push } from "firebase/database";
import { RotatingLines } from 'react-loader-spinner';

const App = () => {
  const db = getDatabase();
  let [input, setInput] = useState("")
  //let [loader, setLoader] = useState(false)
  //let [arr, setArr] = useState([])

  let handleTodo = () => {
    set(push(ref(db, 'alldata/')), {
      name: input,

    }).then(() => {
      console.log("send date to database")
      setInput("")
    });
  }


  return (
    <>
      <RotatingLines
        visible={true}
        height="96"
        width="96"
        color="grey"
        strokeWidth="5"
        animationDuration="0.75"
        ariaLabel="rotating-lines-loading"
        wrapperStyle={{}}
        wrapperClass=""
      />




      <input onChange={(e) => setInput(e.target.value) /*handelChange*/} type="text" />
      <button onClick={handleTodo}>Add ToDo</button>
      {/*<ul>
        {
          arr.map(item => (
            <li>{item}</li>
          ))
        }
      </ul>*/}
    </>
  )
}

export default App