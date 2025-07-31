import React from 'react'

const App = () => {
  let handelChange=(e)=>{
    console.log(e.terget);
  }
  return (
    <>
      <input onChange={handelChange} type="text" />
      <button>Add ToDo</button>
    </>
  )
}

export default App