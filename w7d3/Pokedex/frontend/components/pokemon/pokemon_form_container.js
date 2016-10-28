import {connect} from 'react-redux';
import PokemonForm from './pokemon_form';
import { createNewPokemon } from '../../actions/pokemon_action';
import { selectAllErrors } from '../../reducers/selectors';

const mapDispatchToProps = dispatch => ({
  createPokemon: (pokemon) => dispatch(createNewPokemon(pokemon))
});

const mapStateToProps = state => ({
  errors: selectAllErrors(state)
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonForm);
