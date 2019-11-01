// see types of prompts:
// https://github.com/enquirer/enquirer/tree/master/examples
//
module.exports = [
  {
    type: 'input',
    name: 'name',
    message: 'Name of the service'
  },
  {
    type: 'input',
    name: 'port',
    message: 'Port where service will run'
  },
  {
    type: 'input',
    name: 'model',
    message: 'One main data model that will be in the service'
  }
]
