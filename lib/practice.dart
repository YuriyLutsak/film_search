void main() {
  int b(int c, int d) {
    return c + d;
  }

  // Sorting comparator
  int compare(int c, int d) {
    return c.compareTo(d);
  }

  List<int> list = [5, 4, 3, 2, 1];
  list.sort(compare);

  var listToStr = list.map((e) => (e + 2).toString()).toList();

  list
      .map((e) => e.toString())
      .takeWhile((value) => value.contains('3'))
      .map((e) => int.parse(e))
      .forEach((e) {
    print(e); // No method 'matchAsPrefix' or 'noSuchMethod' in Dart's int class
  });

  var indexed = list.map((e) => e.toString()).toList();
  print(indexed);

  var transformedList = list
      .map((e) => e + 5)
      .map((e) => e.toString())
      .map((e) => int.parse(e))
      .map((e) {
        if (e % 2 != 0) return (e + 5).toString();
        return null;
      })
      .where((e) => e != null)
      .toList();

  var test = list.map((e) => b(33, 22)).toList();
  print(test);

  list.sort((c, d) => compare(c, d));
  print(list);

  Map<int, int> mapInt = {1: 1, 2: 2};

  var mapping = mapInt.map((key, value) {
    return MapEntry(key.isEven ? 1 : 0, value + key.sign);
  }).map((key, value) {
    return MapEntry(key.toString(), value.toString());
  });

  print(mapping);

  mapInt.update(1, (value) {
    return value + b(7, 7);
  });

  print(mapInt);

  var transformedValues = mapInt
      .map((key, value) => MapEntry(key, value + key))
      .values
      .takeWhile((value) => value.isEven)
      .toSet();

  print(transformedValues);

// _$MovieImpl _$$MovieImplFromJson(Map<String, dynamic> json) => _$MovieImpl(
//   id: (json['id'] as num).toInt(),
//   title: json['title'] as String,
//   overview: json['overview'] as String,
//   vote_average: (json['vote_average'] as num).toDouble(),
//   poster_path: json['poster_path'] as String?,
//   genres: (json['genres'] as List<dynamic>?)
//       ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
//       .toList(),
// );

  // Map with triple nested objects
  Map<String, Map<String, Map<String, dynamic>>> nestedMap = {
    'level1': {
      'level2': {
        'item1': 'value1',
        'item2': 123,
        'item3': {
          'subItem1': 'subValue1',
          'subItem2': true,
          'subItem3': [1, 2, 3],
        },
      },
      'level2_2': {
        'item4': 'value4',
        'item5': 456,
        'item6': {
          'subItem4': 'subValue4',
          'subItem5': false,
          'subItem6': [4, 5, 6],
        },
      },
    },
    'level1_2': {
      'level2_3': {
        'item7': 'value7',
        'item8': 789,
        'item9': {
          'subItem7': 'subValue7',
          'subItem8': true,
          'subItem9': [7, 8, 9],
        },
      },
      'level2_4': {
        'item10': 'value10',
        'item11': 101112,
        'item12': {
          'subItem10': 'subValue10',
          'subItem11': false,
          'subItem12': [10, 11, 12],
        },
      },
    },
  };

  print(nestedMap);
}

class MappingFromMap {
  final String subItem;

  var json = {
    "level1": {
      "level2": {
        "item1": "value1",
        "item2": 123,
        "item3": {
          "subItem1": "subValue1",
          "subItem2": true,
          "subItem3": [1, 2, 3]
        }
      },
      "level2_2": {
        "item4": "value4",
        "item5": 456,
        "item6": {
          "subItem4": "subValue4",
          "subItem5": false,
          "subItem6": [4, 5, 6]
        }
      }
    },
    "level1_2": {
      "level2_3": {
        "item7": "value7",
        "item8": 789,
        "item9": {
          "subItem7": "subValue7",
          "subItem8": true,
          "subItem9": [7, 8, 9]
        }
      },
      "level2_4": {
        "item10": "value10",
        "item11": 101112,
        "item12": {
          "subItem10": "subValue10",
          "subItem11": false,
          "subItem12": [10, 11, 12]
        }
      }
    }
  };

  MappingFromMap({required this.subItem});

  MappingFromMap parseJson(Map<String, dynamic> json) {
    return MappingFromMap(
        subItem: (json['level1'] as List<dynamic>)
            .map((e) => e as Map<String, dynamic>)
            .map((e) => e as String)
            .toString());
  }
  void printInfo(){
   // print() ;
  }
}
