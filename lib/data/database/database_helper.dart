import 'dart:developer';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

/// 앱 전체 로컬 데이터베이스 관리 클래스
class DatabaseHelper {
  static const String _databaseName = 'damta.db';
  static const int _databaseVersion = 1;
  static const String mealCacheTable = 'meal_cache'; // 테이블명 상수
  Database? _database;

  /// 데이터베이스 인스턴스 가져오기
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  /// 데이터베이스 초기화
  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _databaseName);
    return await openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  /// 데이터베이스 생성 시 호출
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $mealCacheTable (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        school_code TEXT NOT NULL,
        date TEXT NOT NULL,
        meal_type TEXT NOT NULL,
        dishes_json TEXT NOT NULL,
        kcal TEXT,
        cached_at INTEGER NOT NULL,
        UNIQUE(school_code, date, meal_type)
      )
    ''');

    // 빠른 조회를 위한 인덱스
    await db.execute('''
      CREATE INDEX idx_meal_cache_school_date
      ON $mealCacheTable(school_code, date)
    ''');

    log('모든 테이블 생성 완료');
  }

  /// 데이터베이스 닫기
  Future<void> close() async {
    if (_database != null) {
      await _database!.close();
      _database = null;
      log('데이터베이스 연결 종료');
    }
  }

  /// 데이터베이스 삭제
  Future<void> deleteDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _databaseName);
    await databaseFactory.deleteDatabase(path);
    _database = null;
    log('데이터베이스 삭제 완료');
  }
}
