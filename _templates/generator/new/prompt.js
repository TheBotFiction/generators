// see types of prompts:
// https://github.com/enquirer/enquirer/tree/master/examples
//
module.exports = [
  {
    type: 'input',
    name: 'name',
    message: 'Name of the generator'
  },
  {
    type: 'input',
    name: 'action',
    message: 'Action of the generator',
    initial: 'new'
  }
]
