var React = require('react');
import Formsy from 'formsy-react';
import Input from './input.jsx';
import './formsyValidations.js';

var SudokuCell = React.createClass({
  render: function() {
    return (
        <input className="SudokuCell text-center"
          type="text"
          maxLength="1"
          name={this.props.nbLine + "-" + this.props.nbCell}
        />
    );
  }
});

var SudokuLine = React.createClass({
  render: function() {
    var cells = [];
    var nbCell = this.props.depth * this.props.depth;

    for (var i = 0; i < nbCell;++i)
      cells.push(<SudokuCell key={i} nbLine={this.props.nbLine} nbCell={i} />);
    return (
      <div className="SudokuLine">
        {cells}
      </div>
    );
  }
});

var SudokuGrid = React.createClass({
  render: function() {
    var lines = [];
    var nbLines = this.props.depth * this.props.depth;

    for (var i = 0; i < nbLines;++i)
      lines.push(<SudokuLine key={i} depth={this.props.depth} nbLine={i} />);
    return (
      <div className="sudoku-container">
        <div className={"SudokuGrid depth-" + this.props.depth} >
          {lines}
        </div>
      </div>
    );
  }
});

var SudokuSolverParams = React.createClass({
  getInitialState: function() {
      return {
        depth: this.props.depth,
        canSubmit: true
      };
  },
  handleSubmit: function(params) {
    this.props.onParamsSubmit(params);
  },
  render: function() {
    return (
      <Formsy.Form className="SudokuSolverParams form-inline text-center"
        onValidSubmit={this.handleSubmit}>
        <Input type="number" name="depth" id="depth" min={2} max={4}
          label="Depth"
          value={this.state.depth}
          validations="isMoreThan:1"/>
        <button type="submit" className="btn btn-default">Set</button>
      </Formsy.Form>
    );
  }
});

window.SudokuSolver = React.createClass({
  getInitialState: function() {
    return {depth: 3};
  },
  handleParamsSubmit: function(params) {
    if (params.depth != this.state.depth)
      this.setState({depth: params.depth});
  },
  render: function() {
    return (
      <div className="SudokuSolver">
        <SudokuSolverParams depth={this.state.depth} onParamsSubmit={this.handleParamsSubmit} />
        <SudokuGrid depth={this.state.depth} />
      </div>
    );
  }
});