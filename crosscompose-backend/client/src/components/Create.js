import React from 'react'
import Grid from './Grid'
const API = 'https://crosscompose.herokuapp.com/api/v1/puzzles'

class Create extends React.Component {
  constructor(){
    super()
    this.state = {
      puzzle: null
    }
  }

  componentDidMount(){
    fetch(API + '/create').then(res=>res.json()).then(json => {
      this.setState({
        puzzle: json
      })
    })
  }

  render(){
    return(

      <div>
      { this.state.puzzle ? (<Grid puzzle={this.state.puzzle} play={false}/>) : null }
      </div>
    )
  }


}

export default Create
