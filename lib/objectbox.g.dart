// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'models/bannernews.dart';
import 'models/cartitem.dart';
import 'models/fullnews.dart';
import 'models/menuitem.dart';
import 'models/user.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(5, 2233927649910431469),
      name: 'FullNewsOB',
      lastPropertyId: const IdUid(2, 7715956713455378040),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 6188503905232759776),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 7715956713455378040),
            name: 'name',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(6, 5510275982018042304),
      name: 'BannerNewsOB',
      lastPropertyId: const IdUid(3, 5105894957054602084),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 1428098114543984777),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 1462186012595256539),
            name: 'image',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 5105894957054602084),
            name: 'article',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(7, 8520225248177609433),
      name: 'AdditionDetailOB',
      lastPropertyId: const IdUid(4, 8835554883321975355),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 7447594663688936812),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 1554850855461411695),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 5162454649465947450),
            name: 'price',
            type: 8,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 8835554883321975355),
            name: 'additionId',
            type: 11,
            flags: 520,
            indexId: const IdUid(1, 6399289456110412113),
            relationTarget: 'AdditionOB')
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(8, 7833806798342725161),
      name: 'AdditionOB',
      lastPropertyId: const IdUid(4, 660055670441986083),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 5725147911301061928),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 9209705376093723719),
            name: 'title',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 6903636301366207274),
            name: 'selectedPrice',
            type: 8,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 660055670441986083),
            name: 'menuItemId',
            type: 11,
            flags: 520,
            indexId: const IdUid(2, 9149820165032547205),
            relationTarget: 'MenuItemOB')
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[
        ModelBacklink(
            name: 'additionDetails',
            srcEntity: 'AdditionDetailOB',
            srcField: '')
      ]),
  ModelEntity(
      id: const IdUid(9, 3725869045066890860),
      name: 'IngredientOB',
      lastPropertyId: const IdUid(4, 5241177170435113868),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 5636916387655438282),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 2123898016131721823),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 4074765776421269074),
            name: 'imagePath',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 5241177170435113868),
            name: 'menuItemId',
            type: 11,
            flags: 520,
            indexId: const IdUid(3, 3539021135857203128),
            relationTarget: 'MenuItemOB')
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(10, 2706068186038482142),
      name: 'MenuItemOB',
      lastPropertyId: const IdUid(7, 380297471824909108),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 3968308799936506832),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 6934498969459973799),
            name: 'imagePath',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 7484307875708624359),
            name: 'title',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 5084564747788596945),
            name: 'price',
            type: 8,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 8669383043965553925),
            name: 'category',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 2937418500178822669),
            name: 'description',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 380297471824909108),
            name: 'available',
            type: 1,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[
        ModelBacklink(
            name: 'userReviews', srcEntity: 'UserReviewOB', srcField: ''),
        ModelBacklink(name: 'additions', srcEntity: 'AdditionOB', srcField: ''),
        ModelBacklink(
            name: 'ingredients', srcEntity: 'IngredientOB', srcField: '')
      ]),
  ModelEntity(
      id: const IdUid(11, 2564477860352583731),
      name: 'UserReviewOB',
      lastPropertyId: const IdUid(5, 388836284630429389),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 7496314304006346298),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 4068407573045791850),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 7119787009544846742),
            name: 'message',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 568488990683770149),
            name: 'stars',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 388836284630429389),
            name: 'menuItemId',
            type: 11,
            flags: 520,
            indexId: const IdUid(4, 1668199129613032845),
            relationTarget: 'MenuItemOB')
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(12, 4530192993071638560),
      name: 'UserOB',
      lastPropertyId: const IdUid(5, 301378820354053017),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 1772969239402912101),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 1699615406421456723),
            name: 'userId',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 653484881005465406),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 6214153821840455891),
            name: 'email',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 301378820354053017),
            name: 'address',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(13, 3833050479341648882),
      name: 'CartItemOB',
      lastPropertyId: const IdUid(6, 3307856776703096138),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 6678729505156874727),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 5071892958926488448),
            name: 'image',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 7884979855067482469),
            name: 'content',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 7429239753616127297),
            name: 'quantity',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 5639624088004575433),
            name: 'menuItem_id',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 3307856776703096138),
            name: 'name',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Shortcut for [Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [Store.new] for an explanation of all parameters.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// Returns the ObjectBox model definition for this project for use with
/// [Store.new].
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(13, 3833050479341648882),
      lastIndexId: const IdUid(4, 1668199129613032845),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [
        2203044326659519525,
        7436886197857190181,
        1629771521425256600,
        2897391873509332869
      ],
      retiredIndexUids: const [],
      retiredPropertyUids: const [
        3504729010156614603,
        3048272364630595352,
        5532487186583170030,
        4993169361151491599,
        1715983393606849435,
        5899158864016677619,
        3215544481237852102,
        100303502472173014,
        4654279378717876603
      ],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    FullNewsOB: EntityDefinition<FullNewsOB>(
        model: _entities[0],
        toOneRelations: (FullNewsOB object) => [],
        toManyRelations: (FullNewsOB object) => {},
        getId: (FullNewsOB object) => object.id,
        setId: (FullNewsOB object, int id) {
          object.id = id;
        },
        objectToFB: (FullNewsOB object, fb.Builder fbb) {
          final nameOffset =
              object.name == null ? null : fbb.writeString(object.name!);
          fbb.startTable(3);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = FullNewsOB()
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0)
            ..name = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 6);

          return object;
        }),
    BannerNewsOB: EntityDefinition<BannerNewsOB>(
        model: _entities[1],
        toOneRelations: (BannerNewsOB object) => [],
        toManyRelations: (BannerNewsOB object) => {},
        getId: (BannerNewsOB object) => object.id,
        setId: (BannerNewsOB object, int id) {
          object.id = id;
        },
        objectToFB: (BannerNewsOB object, fb.Builder fbb) {
          final imageOffset =
              object.image == null ? null : fbb.writeString(object.image!);
          final articleOffset =
              object.article == null ? null : fbb.writeString(object.article!);
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, imageOffset);
          fbb.addOffset(2, articleOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = BannerNewsOB()
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0)
            ..image = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 6)
            ..article = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 8);

          return object;
        }),
    AdditionDetailOB: EntityDefinition<AdditionDetailOB>(
        model: _entities[2],
        toOneRelations: (AdditionDetailOB object) => [object.addition],
        toManyRelations: (AdditionDetailOB object) => {},
        getId: (AdditionDetailOB object) => object.id,
        setId: (AdditionDetailOB object, int id) {
          object.id = id;
        },
        objectToFB: (AdditionDetailOB object, fb.Builder fbb) {
          final nameOffset =
              object.name == null ? null : fbb.writeString(object.name!);
          fbb.startTable(5);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addFloat64(2, object.price);
          fbb.addInt64(3, object.addition.targetId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = AdditionDetailOB()
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0)
            ..name = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 6)
            ..price = const fb.Float64Reader()
                .vTableGetNullable(buffer, rootOffset, 8);
          object.addition.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0);
          object.addition.attach(store);
          return object;
        }),
    AdditionOB: EntityDefinition<AdditionOB>(
        model: _entities[3],
        toOneRelations: (AdditionOB object) => [object.menuItem],
        toManyRelations: (AdditionOB object) => {
              RelInfo<AdditionDetailOB>.toOneBacklink(4, object.id,
                      (AdditionDetailOB srcObject) => srcObject.addition):
                  object.additionDetails
            },
        getId: (AdditionOB object) => object.id,
        setId: (AdditionOB object, int id) {
          object.id = id;
        },
        objectToFB: (AdditionOB object, fb.Builder fbb) {
          final titleOffset =
              object.title == null ? null : fbb.writeString(object.title!);
          fbb.startTable(5);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, titleOffset);
          fbb.addFloat64(2, object.selectedPrice);
          fbb.addInt64(3, object.menuItem.targetId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = AdditionOB()
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0)
            ..title = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 6)
            ..selectedPrice =
                const fb.Float64Reader().vTableGet(buffer, rootOffset, 8, 0);
          object.menuItem.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0);
          object.menuItem.attach(store);
          InternalToManyAccess.setRelInfo<AdditionOB>(
              object.additionDetails,
              store,
              RelInfo<AdditionDetailOB>.toOneBacklink(4, object.id,
                  (AdditionDetailOB srcObject) => srcObject.addition));
          return object;
        }),
    IngredientOB: EntityDefinition<IngredientOB>(
        model: _entities[4],
        toOneRelations: (IngredientOB object) => [object.menuItem],
        toManyRelations: (IngredientOB object) => {},
        getId: (IngredientOB object) => object.id,
        setId: (IngredientOB object, int id) {
          object.id = id;
        },
        objectToFB: (IngredientOB object, fb.Builder fbb) {
          final nameOffset =
              object.name == null ? null : fbb.writeString(object.name!);
          final imagePathOffset = object.imagePath == null
              ? null
              : fbb.writeString(object.imagePath!);
          fbb.startTable(5);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addOffset(2, imagePathOffset);
          fbb.addInt64(3, object.menuItem.targetId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = IngredientOB()
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0)
            ..name = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 6)
            ..imagePath = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 8);
          object.menuItem.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0);
          object.menuItem.attach(store);
          return object;
        }),
    MenuItemOB: EntityDefinition<MenuItemOB>(
        model: _entities[5],
        toOneRelations: (MenuItemOB object) => [],
        toManyRelations: (MenuItemOB object) => {
              RelInfo<UserReviewOB>.toOneBacklink(5, object.id,
                      (UserReviewOB srcObject) => srcObject.menuItem):
                  object.userReviews,
              RelInfo<AdditionOB>.toOneBacklink(4, object.id,
                      (AdditionOB srcObject) => srcObject.menuItem):
                  object.additions,
              RelInfo<IngredientOB>.toOneBacklink(4, object.id,
                      (IngredientOB srcObject) => srcObject.menuItem):
                  object.ingredients
            },
        getId: (MenuItemOB object) => object.id,
        setId: (MenuItemOB object, int id) {
          object.id = id;
        },
        objectToFB: (MenuItemOB object, fb.Builder fbb) {
          final imagePathOffset = object.imagePath == null
              ? null
              : fbb.writeString(object.imagePath!);
          final titleOffset =
              object.title == null ? null : fbb.writeString(object.title!);
          final categoryOffset = object.category == null
              ? null
              : fbb.writeString(object.category!);
          final descriptionOffset = object.description == null
              ? null
              : fbb.writeString(object.description!);
          fbb.startTable(8);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, imagePathOffset);
          fbb.addOffset(2, titleOffset);
          fbb.addFloat64(3, object.price);
          fbb.addOffset(4, categoryOffset);
          fbb.addOffset(5, descriptionOffset);
          fbb.addBool(6, object.available);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = MenuItemOB()
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0)
            ..imagePath = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 6)
            ..title = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 8)
            ..price = const fb.Float64Reader()
                .vTableGetNullable(buffer, rootOffset, 10)
            ..category = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 12)
            ..description = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 14)
            ..available =
                const fb.BoolReader().vTableGetNullable(buffer, rootOffset, 16);
          InternalToManyAccess.setRelInfo<MenuItemOB>(
              object.userReviews,
              store,
              RelInfo<UserReviewOB>.toOneBacklink(5, object.id,
                  (UserReviewOB srcObject) => srcObject.menuItem));
          InternalToManyAccess.setRelInfo<MenuItemOB>(
              object.additions,
              store,
              RelInfo<AdditionOB>.toOneBacklink(
                  4, object.id, (AdditionOB srcObject) => srcObject.menuItem));
          InternalToManyAccess.setRelInfo<MenuItemOB>(
              object.ingredients,
              store,
              RelInfo<IngredientOB>.toOneBacklink(4, object.id,
                  (IngredientOB srcObject) => srcObject.menuItem));
          return object;
        }),
    UserReviewOB: EntityDefinition<UserReviewOB>(
        model: _entities[6],
        toOneRelations: (UserReviewOB object) => [object.menuItem],
        toManyRelations: (UserReviewOB object) => {},
        getId: (UserReviewOB object) => object.id,
        setId: (UserReviewOB object, int id) {
          object.id = id;
        },
        objectToFB: (UserReviewOB object, fb.Builder fbb) {
          final nameOffset =
              object.name == null ? null : fbb.writeString(object.name!);
          final messageOffset =
              object.message == null ? null : fbb.writeString(object.message!);
          fbb.startTable(6);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addOffset(2, messageOffset);
          fbb.addInt64(3, object.stars);
          fbb.addInt64(4, object.menuItem.targetId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = UserReviewOB()
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0)
            ..name = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 6)
            ..message = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 8)
            ..stars = const fb.Int64Reader()
                .vTableGetNullable(buffer, rootOffset, 10);
          object.menuItem.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 12, 0);
          object.menuItem.attach(store);
          return object;
        }),
    UserOB: EntityDefinition<UserOB>(
        model: _entities[7],
        toOneRelations: (UserOB object) => [],
        toManyRelations: (UserOB object) => {},
        getId: (UserOB object) => object.id,
        setId: (UserOB object, int id) {
          object.id = id;
        },
        objectToFB: (UserOB object, fb.Builder fbb) {
          final userIdOffset =
              object.userId == null ? null : fbb.writeString(object.userId!);
          final nameOffset =
              object.name == null ? null : fbb.writeString(object.name!);
          final emailOffset =
              object.email == null ? null : fbb.writeString(object.email!);
          final addressOffset =
              object.address == null ? null : fbb.writeString(object.address!);
          fbb.startTable(6);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, userIdOffset);
          fbb.addOffset(2, nameOffset);
          fbb.addOffset(3, emailOffset);
          fbb.addOffset(4, addressOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = UserOB()
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0)
            ..userId = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 6)
            ..name = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 8)
            ..email = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 10)
            ..address = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 12);

          return object;
        }),
    CartItemOB: EntityDefinition<CartItemOB>(
        model: _entities[8],
        toOneRelations: (CartItemOB object) => [],
        toManyRelations: (CartItemOB object) => {},
        getId: (CartItemOB object) => object.id,
        setId: (CartItemOB object, int id) {
          object.id = id;
        },
        objectToFB: (CartItemOB object, fb.Builder fbb) {
          final imageOffset =
              object.image == null ? null : fbb.writeString(object.image!);
          final contentOffset =
              object.content == null ? null : fbb.writeString(object.content!);
          final nameOffset =
              object.name == null ? null : fbb.writeString(object.name!);
          fbb.startTable(7);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, imageOffset);
          fbb.addOffset(2, contentOffset);
          fbb.addInt64(3, object.quantity);
          fbb.addInt64(4, object.menuItem_id);
          fbb.addOffset(5, nameOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = CartItemOB()
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0)
            ..image = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 6)
            ..content = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 8)
            ..quantity =
                const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 10)
            ..menuItem_id =
                const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 12)
            ..name = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 14);

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [FullNewsOB] entity fields to define ObjectBox queries.
class FullNewsOB_ {
  /// see [FullNewsOB.id]
  static final id =
      QueryIntegerProperty<FullNewsOB>(_entities[0].properties[0]);

  /// see [FullNewsOB.name]
  static final name =
      QueryStringProperty<FullNewsOB>(_entities[0].properties[1]);
}

/// [BannerNewsOB] entity fields to define ObjectBox queries.
class BannerNewsOB_ {
  /// see [BannerNewsOB.id]
  static final id =
      QueryIntegerProperty<BannerNewsOB>(_entities[1].properties[0]);

  /// see [BannerNewsOB.image]
  static final image =
      QueryStringProperty<BannerNewsOB>(_entities[1].properties[1]);

  /// see [BannerNewsOB.article]
  static final article =
      QueryStringProperty<BannerNewsOB>(_entities[1].properties[2]);
}

/// [AdditionDetailOB] entity fields to define ObjectBox queries.
class AdditionDetailOB_ {
  /// see [AdditionDetailOB.id]
  static final id =
      QueryIntegerProperty<AdditionDetailOB>(_entities[2].properties[0]);

  /// see [AdditionDetailOB.name]
  static final name =
      QueryStringProperty<AdditionDetailOB>(_entities[2].properties[1]);

  /// see [AdditionDetailOB.price]
  static final price =
      QueryDoubleProperty<AdditionDetailOB>(_entities[2].properties[2]);

  /// see [AdditionDetailOB.addition]
  static final addition = QueryRelationToOne<AdditionDetailOB, AdditionOB>(
      _entities[2].properties[3]);
}

/// [AdditionOB] entity fields to define ObjectBox queries.
class AdditionOB_ {
  /// see [AdditionOB.id]
  static final id =
      QueryIntegerProperty<AdditionOB>(_entities[3].properties[0]);

  /// see [AdditionOB.title]
  static final title =
      QueryStringProperty<AdditionOB>(_entities[3].properties[1]);

  /// see [AdditionOB.selectedPrice]
  static final selectedPrice =
      QueryDoubleProperty<AdditionOB>(_entities[3].properties[2]);

  /// see [AdditionOB.menuItem]
  static final menuItem =
      QueryRelationToOne<AdditionOB, MenuItemOB>(_entities[3].properties[3]);
}

/// [IngredientOB] entity fields to define ObjectBox queries.
class IngredientOB_ {
  /// see [IngredientOB.id]
  static final id =
      QueryIntegerProperty<IngredientOB>(_entities[4].properties[0]);

  /// see [IngredientOB.name]
  static final name =
      QueryStringProperty<IngredientOB>(_entities[4].properties[1]);

  /// see [IngredientOB.imagePath]
  static final imagePath =
      QueryStringProperty<IngredientOB>(_entities[4].properties[2]);

  /// see [IngredientOB.menuItem]
  static final menuItem =
      QueryRelationToOne<IngredientOB, MenuItemOB>(_entities[4].properties[3]);
}

/// [MenuItemOB] entity fields to define ObjectBox queries.
class MenuItemOB_ {
  /// see [MenuItemOB.id]
  static final id =
      QueryIntegerProperty<MenuItemOB>(_entities[5].properties[0]);

  /// see [MenuItemOB.imagePath]
  static final imagePath =
      QueryStringProperty<MenuItemOB>(_entities[5].properties[1]);

  /// see [MenuItemOB.title]
  static final title =
      QueryStringProperty<MenuItemOB>(_entities[5].properties[2]);

  /// see [MenuItemOB.price]
  static final price =
      QueryDoubleProperty<MenuItemOB>(_entities[5].properties[3]);

  /// see [MenuItemOB.category]
  static final category =
      QueryStringProperty<MenuItemOB>(_entities[5].properties[4]);

  /// see [MenuItemOB.description]
  static final description =
      QueryStringProperty<MenuItemOB>(_entities[5].properties[5]);

  /// see [MenuItemOB.available]
  static final available =
      QueryBooleanProperty<MenuItemOB>(_entities[5].properties[6]);
}

/// [UserReviewOB] entity fields to define ObjectBox queries.
class UserReviewOB_ {
  /// see [UserReviewOB.id]
  static final id =
      QueryIntegerProperty<UserReviewOB>(_entities[6].properties[0]);

  /// see [UserReviewOB.name]
  static final name =
      QueryStringProperty<UserReviewOB>(_entities[6].properties[1]);

  /// see [UserReviewOB.message]
  static final message =
      QueryStringProperty<UserReviewOB>(_entities[6].properties[2]);

  /// see [UserReviewOB.stars]
  static final stars =
      QueryIntegerProperty<UserReviewOB>(_entities[6].properties[3]);

  /// see [UserReviewOB.menuItem]
  static final menuItem =
      QueryRelationToOne<UserReviewOB, MenuItemOB>(_entities[6].properties[4]);
}

/// [UserOB] entity fields to define ObjectBox queries.
class UserOB_ {
  /// see [UserOB.id]
  static final id = QueryIntegerProperty<UserOB>(_entities[7].properties[0]);

  /// see [UserOB.userId]
  static final userId = QueryStringProperty<UserOB>(_entities[7].properties[1]);

  /// see [UserOB.name]
  static final name = QueryStringProperty<UserOB>(_entities[7].properties[2]);

  /// see [UserOB.email]
  static final email = QueryStringProperty<UserOB>(_entities[7].properties[3]);

  /// see [UserOB.address]
  static final address =
      QueryStringProperty<UserOB>(_entities[7].properties[4]);
}

/// [CartItemOB] entity fields to define ObjectBox queries.
class CartItemOB_ {
  /// see [CartItemOB.id]
  static final id =
      QueryIntegerProperty<CartItemOB>(_entities[8].properties[0]);

  /// see [CartItemOB.image]
  static final image =
      QueryStringProperty<CartItemOB>(_entities[8].properties[1]);

  /// see [CartItemOB.content]
  static final content =
      QueryStringProperty<CartItemOB>(_entities[8].properties[2]);

  /// see [CartItemOB.quantity]
  static final quantity =
      QueryIntegerProperty<CartItemOB>(_entities[8].properties[3]);

  /// see [CartItemOB.menuItem_id]
  static final menuItem_id =
      QueryIntegerProperty<CartItemOB>(_entities[8].properties[4]);

  /// see [CartItemOB.name]
  static final name =
      QueryStringProperty<CartItemOB>(_entities[8].properties[5]);
}
