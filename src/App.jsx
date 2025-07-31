import React from 'react'

const App = () => {
  let handelChange =(e)=>{
    console.log(e.target.value);
  }
  return (
    <>
      <input onChange={handelChange} type="text" />
      <button>Add ToDo</button>
    </>
  )
}

export default App