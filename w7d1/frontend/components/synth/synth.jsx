import React from 'react';

import { NOTE_NAMES, TONES } from '../../util/tones';
import Note from '../../util/note';
import NoteKey from './note_key';
import $ from 'jquery';

class Synth extends React.Component {
  constructor(props) {
    super(props);
    this.notes = NOTE_NAMES.map(note => (new Note(TONES[note])));
  }

  componentDidMount() {
    $(document).on('keydown', e => this.onKeyDown(e));
    $(document).on('keyup', e => this.onKeyUp(e));
  }

  onKeyDown(e){
    this.props.keyPressed(e.key);
  }

  onKeyUp(e){
    this.props.keyReleased(e.key);
  }

  playNotes(){
    NOTE_NAMES.forEach((note, idx) => {
      if (this.props.notes.indexOf(note) !== -1) {
        this.notes[idx].start();
      } else {
        this.notes[idx].stop();
      }
    });
  }

  render(){
    this.playNotes();
    const noteKeys = NOTE_NAMES.map((note, idx) => (
      <NoteKey key={idx} note={note} pressed={this.props.notes.includes(note)}/>
    ));
    return(
      <div>
        <ul>
          {noteKeys}
        </ul>
      </div>
    );
  }
}

export default Synth;
