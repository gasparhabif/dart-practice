// Custom Definitions Operators
const definitionOpener = ':';
const definitionCloser = ';';

// Stack Operators
const duplicate = 'DUP';
const drop = 'DROP';
const swap = 'SWAP';
const over = 'OVER';

// Arithmetic Operators
const addition = '+';
const subtraction = '-';
const multiply = '*';
const division = '/';

final emptyStack = Exception('Stack empty');
final ceroDivision = Exception('Division by zero');
final invalidDefinition = Exception('Invalid definition');
final unknownCommand = Exception('Unknown command');

enum DefinitionState { STARTED, NAMED, WAITING }

class Forth {
  Map<String, String> _definitions = {};
  List<int> _stack = [];
  DefinitionState _defState = DefinitionState.WAITING;
  String _defName = "";
  String _defValue = "";

  List<int> get stack => _stack;

  void evaluate(String input) {
    List<String> words = input.toUpperCase().split(' ');
    words.forEach((word) {
      var number = int.tryParse(word);

      // If it is able to parse a definition, then that word
      // is already used and should return.
      if (_parseDefinition(word, number)) return;

      if (number != null)
        _stack.add(number);
      else
        _evaluateString(word);
    });
  }

  bool _parseDefinition(String word, int? number) {
    if (word == definitionOpener) {
      _defState = DefinitionState.STARTED;
      return true;
    }

    if (_defState == DefinitionState.STARTED) {
      if (number != null) {
        throw invalidDefinition;
      }
      _defName = word;
      _defState = DefinitionState.NAMED;
      return true;
    }

    if (_defState == DefinitionState.NAMED) {
      if (word != definitionCloser)
        _addValueToDefinition(word);
      else {
        _definitions[_defName] = _defValue;
        _defState = DefinitionState.WAITING;
        _defName = "";
        _defValue = "";
      }
      return true;
    }

    return false;
  }

  void _addValueToDefinition(String word) {
    String separator = _defValue.isNotEmpty ? ' ' : '';
    String? reDefinition = _definitions[word];
    String wordToAdd = reDefinition == null ? word : reDefinition;
    _defValue += '$separator$wordToAdd';
  }

  void _evaluateString(String word) {
    var customDef = _definitions[word];
    if (customDef == null) {
      _evaluatePossibleOperation(word);
    } else {
      evaluate(customDef);
    }
  }

  void _evaluatePossibleOperation(String word) {
    _checkNotDefinitionAndValidStack(word);
    var n1 = _stack.first;
    var n2 = _stack.last;

    switch (word) {
      case addition:
        _stack.clear();
        _stack.add(n1 + n2);
        break;
      case subtraction:
        _stack.clear();
        _stack.add(n1 - n2);
        break;
      case multiply:
        _stack.clear();
        _stack.add(n1 * n2);
        break;
      case division:
        if (n2 == 0) throw ceroDivision;
        _stack.clear();
        _stack.add((n1 / n2).floor());
        break;
      case duplicate:
        _stack.add(_stack.last);
        break;
      case drop:
        _stack.removeLast();
        break;
      case swap:
        _swap(n2);
        break;
      case over:
        _over();
        break;
    }
  }

  void _checkNotDefinitionAndValidStack(String word) {
    bool isTwoElementWord =
        [addition, subtraction, multiply, division, swap, over].contains(word);
    bool isOneElementWord = [duplicate, drop].contains(word);

    if (isTwoElementWord && _stack.length < 2) throw emptyStack;
    if (isOneElementWord && _stack.length < 1) throw emptyStack;
    if (!isOneElementWord && !isTwoElementWord) throw unknownCommand;
  }

  void _swap(int previousLast) {
    var newLast = _stack.elementAt(_stack.length - 2);
    _stack.removeLast();
    _stack.removeLast();
    _stack.addAll([previousLast, newLast]);
  }

  void _over() {
    var prevToLast = _stack.elementAt(_stack.length - 2);
    _stack.add(prevToLast);
  }
}
