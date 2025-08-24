import React, { useEffect } from 'react'
import { useState } from 'react'
import { getDatabase, ref, set, push, onValue } from "firebase/database";
import { RotatingLines } from 'react-loader-spinner';
import Im1 from './assets/ai.gif'

const App = () => {
  const db = getDatabase();
  let [input, setInput] = useState("")
  let [loader, setLoader] = useState(false)
  let [alldata, setAllData] = useState([])

  let handleTodo = () => {
    setLoader(true)
    set(push(ref(db, 'users/')), {
      name: input,

    }).then(() => {
      setInput("")
      setLoader(false)
    });
  }

  //console.log(alldata);

  useEffect(() => {
    const starCountRef = ref(db, 'users/');
    onValue(starCountRef, (snapshot) => {
      //console.log(snapshot.val());
      let arr = [];
      snapshot.forEach(item => {
        //console.log(item.val());
        arr.push(item.val());

      })
      setAllData(arr);
    });

  }, [])
  return (
    <>




      <input onChange={(e) => setInput(e.target.value) /*handelChange*/} type="text" />

      {
        loader ?
          <RotatingLines
            visible={true}
            height="40"
            width="40"
            color="grey"
            strokeWidth="5"
            animationDuration="0.75"
            ariaLabel="rotating-lines-loading"
            wrapperStyle={{}}
            wrapperClass=""
          />
          //<img src={Im1} />
          //<h1>Loading Data..............</h1>
          :
          <button onClick={handleTodo}>Add ToDo</button>
      }
      {/*<ul>
        {
          arr.map(item => (
            <li>{item}</li>
          ))
        }
      </ul>*/}
      <ul>
        {
          alldata.map(item => (
            <li>{item.name}</li>
          ))
        }
      </ul>
    </>
  )
}

export default App