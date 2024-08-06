import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import 'package:stack_exchange_task/features/questions/data/models/question_model.dart';

class DatabaseHelper {
  // Private named constructor
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper _instance = DatabaseHelper._privateConstructor();

  // Factory constructor
  factory DatabaseHelper() {
    return _instance;
  }

  static const _databaseName = "questions.db";
  static const _databaseVersion = 1;

  static const table = 'questions';

  static const columnId = 'id';
  static const columnTags = 'tags';
  static const columnOwner = 'owner';
  static const columnIsAnswered = 'is_answered';
  static const columnViewCount = 'view_count';
  static const columnAnswerCount = 'answer_count';
  static const columnScore = 'score';
  static const columnLastActivityDate = 'last_activity_date';
  static const columnCreationDate = 'creation_date';
  static const columnLastEditDate = 'last_edit_date';
  static const columnQuestionId = 'question_id';
  static const columnContentLicense = 'content_license';
  static const columnLink = 'link';
  static const columnTitle = 'title';

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnTags TEXT,
        $columnOwner TEXT,
        $columnIsAnswered INTEGER,
        $columnViewCount INTEGER,
        $columnAnswerCount INTEGER,
        $columnScore INTEGER,
        $columnLastActivityDate INTEGER,
        $columnCreationDate INTEGER,
        $columnLastEditDate INTEGER,
        $columnQuestionId INTEGER,
        $columnContentLicense TEXT,
        $columnLink TEXT,
        $columnTitle TEXT
      )
    ''');
  }

  Future<int> insert(QuestionModel question) async {
    final db = await database;
    return await db.insert(table, question.toMap());
  }

  Future<List<QuestionModel>> queryAll() async {
    final db = await database;
    final maps = await db.query(table);
    return maps.isNotEmpty
        ? maps.map((map) => QuestionModel.fromMap(map)).toList()
        : [];
  }

  Future<int> deleteAll() async {
    final db = await database;
    return await db.delete(table);
  }
}
