import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:musik/backend/data_processor.dart';
import 'package:spotify/spotify.dart';

void main() {
  test('data', () async {
    await dotenv.load(fileName: 'lib/.env');
    expect('lib/utils/data.json', dotenv.env['FILEPATH']);
  });

  test('data', () async {
    await dotenv.load(fileName: 'lib/.env');
    expect('lib/utils/data.json', dotenv.env['FILEPATH']);

    final credentials = SpotifyApiCredentials(
        dotenv.env['CLIENTID'], dotenv.env['CLIENTSECRET']);
    final spotify = SpotifyApi(credentials);
    DataProcessor dataProc = DataProcessor();
    await dataProc.loadDataFromJsonFile(dotenv.env['FILEPATH']!);
    print(dataProc.dataList[0].type);
    expect(dataProc.dataList.length, 10);

    for (var element in dataProc.dataList) {
      if (element.type == 'track') {
        print(element.id);
      }
    }

    // final ts = spotify.tracks.listInBatches([
    //   '4u7EnebtmKWzUH433cf5Qv',
    //   '3z8h0TU7ReDPLIbEnYhWZb',
    //   '5jnxScfRVyWskdfPGjTF7c',
    //   '2YSbHu9XF4bNYWt3MnIhgE',
    //   '0lrkMvRttmoXjMNS8YONvj',
    //   '5txoZyuAmtCfmDjUCEphWm',
    //   '4dPKZJKJzPl4TEWLsMdohE',
    //   '300YN8ebGB90nDuzgz0f3O',
    //   '7xHATAMD7ezTZGYsNAMr5R',
    //   '7iAqvWLgZzXvH38lA06QZg',
    // ]);

    // print(ts.length);

    final t = await spotify.tracks.get('7iAqvWLgZzXvH38lA06QZg');

    print(t.previewUrl);
  });
}
